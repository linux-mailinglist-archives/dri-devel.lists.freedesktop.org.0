Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E19716343FB
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 19:50:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5860810E1B4;
	Tue, 22 Nov 2022 18:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3A410E1B4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 18:50:04 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id z17so10919746qki.11
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 10:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ONbu9NKlge4aXI9Ua7o2VzF2jzXIMd69Emtlg0d7jig=;
 b=IZKFXNiZAlcvGwZQTvz/r/qBZwYoEU1en/WCdwOhRJpkMk3ITVUKCyqFv1Fg3YhSYW
 soSRWrqa4zMFE1MNo7W75NuLN5BjHz51yECrbqGhCMgVG6CjPpqABPfrYn4Q/owPA+yw
 AYsKZsRgQzRliHSdxw2gsiCGn6zDm59p/MaGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ONbu9NKlge4aXI9Ua7o2VzF2jzXIMd69Emtlg0d7jig=;
 b=4apfyyyq/WOZZYfAjgqWpgPSEfwCc66jmMtz6FhXeS4/lHWkE/4kfSDHUG3U5nlIaz
 cjWsvOPD0vEfWnUHHjL95x7qdasLa02yttNvWGv/6AofZXC/44/eUPOcWawdy+TYjXt8
 XoGURBNa+kvUf0puKGHuegPmsPdn6RQ43Tz4HYKOB9QVjV21XF06snbOb3HcDaGAtxy5
 Ks2EjEXmXDjG6CmCD5yYllM5VLfhF6/xTXmSzi8xWP68vxmmZop5hdyPkUPL3ONCJtJT
 77iBdZy5KNwqEAfoREXLgvXb9Ji6Dq37gNyi82cBZttdWDvr1S/17nHN2pMLhD7ivfks
 4DGA==
X-Gm-Message-State: ANoB5pmVYvV1KP5bjfahvNfME2awBkMa5R5W5mdK3HbYUn8aCOu0ClY6
 nbUTSVtNAZ8hPcdDk502YV2zgA==
X-Google-Smtp-Source: AA0mqf7itZdsyAHiBGYxZMtg5NwoOzvapT2HLFR+k8Fs3wLuJuONAiRFiwc/YfCWsZSdRRay/KEIEg==
X-Received: by 2002:a05:620a:918:b0:6f9:de1b:8809 with SMTP id
 v24-20020a05620a091800b006f9de1b8809mr21822200qkv.296.1669143003547; 
 Tue, 22 Nov 2022 10:50:03 -0800 (PST)
Received: from meerkat.local
 (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
 by smtp.gmail.com with ESMTPSA id
 y12-20020a37f60c000000b006e8f8ca8287sm10289830qkj.120.2022.11.22.10.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 10:50:03 -0800 (PST)
Date: Tue, 22 Nov 2022 13:50:01 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: git send-email friendly smtp provider anyone?
Message-ID: <20221122185001.q6hmeblp64jqdzvz@meerkat.local>
References: <1bc45775-0667-01f8-36e1-9f65d3081092@tronnes.org>
 <20221121151922.jaal6ym7z2ejju4q@houat>
 <de12952f-8346-8995-236d-69dcb70f19f6@tronnes.org>
 <20221122155122.edxtmsqpjxgj4dsj@meerkat.local>
 <3b06dfd5-0eb4-dbfc-6ba8-077b1a92865b@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3b06dfd5-0eb4-dbfc-6ba8-077b1a92865b@tronnes.org>
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
Cc: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 22, 2022 at 06:42:19PM +0100, Noralf Trønnes wrote:
> The first thing that strikes me is that everyone mentioned in one of the
> patches get the entire patchset, even stable@vger.kernel.org (cc'ed in a
> fixes patch). The first patch touches a core file and as a result a few
> drivers, so I've cc'ed the driver maintainers in that patch, but now
> they get the entire patchset where 5 of 6 patches is about a driver that
> I maintain. So from their point of view, they see a patchset about a
> driver they don't care about and a patch touching a core file, but from
> the subject it's not apparent that it touches their driver. I'm afraid
> that this might result in none of them looking at that patch. In this
> particular case it's not that important, but in another case it might be.

I did some (unscientific) polling among kernel maintainers and, by a vast
margin, they always prefer to receive the entire series instead of
cherry-picked patches -- having the entire series helps provide important
context for the change they are looking at.

So, this is deliberate and, for now at least, not configurable. Unless you're
sending 100+ patch series, I doubt anyone will have any problem with receiving
the whole series instead of individual patches.

> As for the setting up the web endpoint, should I just follow the b4 docs
> on that?
> 
> I use b4 version 0.10.1, is that recent enough?

Yes. There will be a 0.10.2 in the near future, but the incoming fixes
shouldn't make much difference for the b4 send code.

-K
