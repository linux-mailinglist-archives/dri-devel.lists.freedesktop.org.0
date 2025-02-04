Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B7BA27FB7
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 00:37:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B1410E029;
	Tue,  4 Feb 2025 23:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wrx7RVIK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1129210E6D3
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 17:40:14 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 46e09a7af769-71e565708beso3174616a34.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2025 09:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738690813; x=1739295613;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4yNpm3oxBxQoK8aYrbHM1Sjc+SJkp488Q51eRV/v/s8=;
 b=wrx7RVIKxT94pBy/CKlziZxT+zQVsBdfyZeFG5fDIhev7ZfH1j+FMIe66PiMDxtKaq
 dVBcFY+lnRisURu4KZlp6hEWs9yRjxs/UKAvFkL3P3IUQ3hm7Z0E5h1PQpxTMSH9iHnw
 ZH1E7h3JrFdi8I5D6IDcSvDTqPCGgMIvvpUsqZD8zKjjhv0RlzS7z3sIxvemeT1d2TYF
 C/TjbNcBFMH6w62PXcCj2W4qeQ25DGkIrOSVGHEaLznMFwXRLOVY5C46nOV81dyiL7+E
 zh6hrE8Pem42AENDXibdo2MBTMmVOUCREBJuPh4j//yfZu+Uq6bZVtW7sg3Kk9ZHTNiw
 O2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738690813; x=1739295613;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4yNpm3oxBxQoK8aYrbHM1Sjc+SJkp488Q51eRV/v/s8=;
 b=leazacxDmqzBNW20/ep2ySxoxBibELSqAo2aC9QPV0dfIMPKO7anDwSp7j9vgqoqFE
 skpt7hWg8jiHdLOrX13/wxZ+3gQ2O7s+QOlIYETFgqXE789THFZlAsf+DyepmU0Mqd38
 zmDrxkeWwgl4CXq5gF9BDwIJBol8UXBcfrmB89HiTl/TZZX9JYXUzmBw/9s2ja3wFgMi
 WGuzCmP7g9r09+nUqRZInHmXrx/sniaYFgmLpDF1zeFux6ojnZ0gBADJu87Z4WsWFvl4
 jc0h6EZn6h1e9gIcdcGdIduqqcvVQ3WlhvqUyg5VW2WGlWKYSWb/dKxG/AG65DVFsXus
 QowA==
X-Gm-Message-State: AOJu0YwH7CwnIy93WpD8Ju0zoI/u/gkeUe/bcbPPutwx1fYIysxDZQH8
 OIOiP0hZ5RsuQMuVWkt7RRdz9BlzS/qn7ZrVqduG8uVdHXP7PwWlx5+3UQ0TUWc=
X-Gm-Gg: ASbGncvf4sHaWYdny7TlreWgwgl+zA1SpiBSZmhqwtVo6b/XZygtsmLJbvpBZ2sDxXV
 uZC5+6uIM4FbDRyq4ivlqTyJHSZo3ejnDssCKaM1Ol4F1hfpSGD2JDg++sL2NUxZg3b8ytYDniv
 m5lzZisTJ0Z/7yR7+sSm7ujlEagmoh5b1F7B1yhEY6/wNMZr/4ksyz0s5pASF2qKdDk0STqSUw2
 BK3vFXupMM8v9FrVGXyGgskT43ZOzOh+3LUhLzM1mDAwYIpePSttQum70Am2voE4XxbqBThbvUk
 7OuxBaipk2CTafk8q31Z5Bxpu65aXbVB6rLQybkqBTQV+Jjj/UrO
X-Google-Smtp-Source: AGHT+IHMhe2zw6EhaL7q6kTxgWmbctXCIhVeGH/cEyX92tLO3USqYme0owv4+lKlSehxaf+Qho0gDg==
X-Received: by 2002:a05:6830:dca:b0:71d:f8bd:4be4 with SMTP id
 46e09a7af769-726568db701mr16382704a34.19.1738690813188; 
 Tue, 04 Feb 2025 09:40:13 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-726617eb165sm3408870a34.38.2025.02.04.09.40.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 09:40:12 -0800 (PST)
Message-ID: <e4befaab-9622-40d3-bd4c-e12111df45e7@baylibre.com>
Date: Tue, 4 Feb 2025 11:40:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-resent-to-correct-ml 0/8] drm/xe: Convert xe_force_wake
 calls to guard helpers.
To: Maarten Lankhorst <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
 Boqun Feng <boqun.feng@gmail.com>
References: <20250204132238.162608-1-dev@lankhorst.se>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250204132238.162608-1-dev@lankhorst.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 04 Feb 2025 23:37:37 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/4/25 7:22 AM, Maarten Lankhorst wrote:
> Ignore my previous series please, it should have been sent to intel-xe, was sent to intel-gfx.
> 
> Instead of all this repetition of
> 
> {
> 	unsigned fw_ref;
> 
> 	fw_ref = xe_force_wake_get(fw, domain);
> 	if (!xe_force_wake_ref_has_domain(..))
> 		return -ETIMEDOUT;
> 
> 	...
> 
> out:
> 	xe_force_wake_put(fw_ref);
> 	return ret;
> }
> 
> I thought I would look at how to replace it with the guard helpers.
> It is easy, but it required some minor fixes to make DEFINE_LOCK_GUARD_1
> work with extra init arguments.
> 
> So I changed the function signature slightly to make the first optional argument
> a struct member (current behavior), and any additional argument goes to the init
> call.
> 
> This replaces the previous code with
> {
> 	scoped_cond_guard(xe_force_wake_get, return -ETIMEDOUT, fw, domain) {
> 		....
> 
> 		return ret;
> 	}
> }
> 
> I' ve thought also of playing with this:
> {
> 	CLASS(xe_force_wake_get, fw_ref)(fw, domain);
> 	if (!fw_ref.lock))
> 		return -ETIMEDOUT;
> 
> 	...
> 	return ret;
> }
> 
> I'm just fearing that the scoped_cond_guard makes it imposssible to get this
> wrong, while in the second example it's not clear that it can fail, and that
> you have to check.
> 
> Let me know what you think!
> Feedback welcome for the header change as well, should probably go into the locking tree..
> 
When I tried to make a similar improvement, Linus said to please stop trying
with the conditional guard stuff [1]. So my advice is don't do it.

Just replace the:

> 	...
> 
> out:

with a helper function if you want to get rid of the gotos.

That is what we are doing in the iio subsystem [2][3].

[1]: https://lore.kernel.org/all/CAHk-=whn07tnDosPfn+UcAtWHBcLg=KqA16SHVv0GV4t8P1fHw@mail.gmail.com/
[2]: https://lore.kernel.org/all/20250105172613.1204781-1-jic23@kernel.org/
[3]: https://lore.kernel.org/all/20250202210045.1a9e85d7@jic23-huawei/
