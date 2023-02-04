Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEA768A7B3
	for <lists+dri-devel@lfdr.de>; Sat,  4 Feb 2023 02:56:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748C810E099;
	Sat,  4 Feb 2023 01:56:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C62210E099;
 Sat,  4 Feb 2023 01:56:39 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id j1so866774pjd.0;
 Fri, 03 Feb 2023 17:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KAWQVltchINdESu1keirl+Juwz9kMSkbmqmPLABnVbo=;
 b=QTuOo3d0ewbioZYf6mnFIAlDpeSCJHTbUuksJIgSc6sVTD/qzHLKCQAj5xBdOM2bmO
 Soo707EBxlJBabfYQwsYxXbrjFzpIxEqeVQPd5sLdmlTvcuBcIi9QE4l1HwQAO+k7bjc
 boc2GIDowt/ri8sHZRd0uJXZN4qE9R6FUeZwvG0VTWCr229rh3THEWu+0uVg20392Win
 Im6B9qUX8zWdMoD2w4ivMDJqXf3614CjuknmLhcVurQCzn6AcCFrHDStbLJ3ET1rRjhf
 XcFEzstYVHWA7dbx2kCTawoGgAjJ3HyKzMNuZ7/wCCcox6ptbGOjmB6fXVCFhq9AoXr/
 TsrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KAWQVltchINdESu1keirl+Juwz9kMSkbmqmPLABnVbo=;
 b=yI3w25CIhd7mmxOEjC9VwWcCOOALlEkZoTSspies2+xJjAeUOxz5XS62GjX3e9ABJx
 67k0et87gUQ8Sa3wnVHQG1ZoJMHDw+nb2D1jYFW6Qy6Yt/L+zIAm8xp+0MkZ6pENfUT3
 65nxw8grDB7JtSeYUvX0t3ytPRrRf0HiiVXwkptacUdBIHPJRfs6yvgzAM7EbLO+KNeE
 gIiXYpTY47MJHMJm9gebaI9+olRnQXspAnoRZcLL5W1cmpGgkS6rNqX9+KFEKM/kPmY+
 NlvbIFVlugvrb1wC+eyXb69+jr6e+JIHWzBDeny/pvOeKArfKNbWsRlhYmIEjlgvURFe
 JOtA==
X-Gm-Message-State: AO0yUKWk9SJzNFuqacR8q+XfuyzHbhUeVj4KKzocSmO1WN1Xu4SZd7IM
 DnVOhdIcIX487dDrdNsihPI=
X-Google-Smtp-Source: AK7set8sBWWRuULWZIPZU3d4F7wNKydipPZKkOR5r2H8zeah5I958RN7LP7qBe8E0SYh9UqoNtYrQA==
X-Received: by 2002:a17:902:c944:b0:196:4652:7cff with SMTP id
 i4-20020a170902c94400b0019646527cffmr13150025pla.11.1675475798893; 
 Fri, 03 Feb 2023 17:56:38 -0800 (PST)
Received: from [192.168.43.80] (subs02-180-214-232-73.three.co.id.
 [180.214.232.73]) by smtp.gmail.com with ESMTPSA id
 je10-20020a170903264a00b00189e1522982sm2265553plb.168.2023.02.03.17.56.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 17:56:38 -0800 (PST)
Message-ID: <6a5592a8-10f9-9c08-0a4b-fcf49d8acc1f@gmail.com>
Date: Sat, 4 Feb 2023 08:56:30 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/3] drm/scheduler: Fix elapsed_ns kernel-doc error
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>,
 Intel Graphics Development List <intel-gfx@lists.freedesktop.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230203100215.31852-1-bagasdotme@gmail.com>
 <20230203100215.31852-3-bagasdotme@gmail.com>
 <99c4db33a1966bd1979817277facb4a42ba2333f.camel@pengutronix.de>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <99c4db33a1966bd1979817277facb4a42ba2333f.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Srinivasan Shanmugam <srinivasan.s@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>, Hans de Goede <hdegoede@redhat.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?Q?Jos=c3=a9_Roberto_de_Souza?= <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/3/23 18:27, Lucas Stach wrote:
> Thanks, I've added this to the etnaviv tree.
> 
> Since the commit is only in -next and not a non-rebase tree yet, I
> might be tempted to squash the fix into the offending commit. What
> would be the right way to credit you for the fix in that case?
> 

On SoB area, you can add:

[Bagas: Append missing colon to @elapsed_ns]
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

