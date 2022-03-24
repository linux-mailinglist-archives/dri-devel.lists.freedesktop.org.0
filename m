Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7854E65B9
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 15:55:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFDF810E8D7;
	Thu, 24 Mar 2022 14:55:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0223C10E8D7
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 14:55:23 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id r64so2873943wmr.4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 07:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ugHrK80HET8DZ+f74WXVZ6NolmaYIO5eOQX+LhNJahg=;
 b=AJCj/zXjgICiAM6Sf8VVdd5x8Xm4KQgPnUhD7Eq/Kg/cYJh9gjSoxdFjIVApiwnMSn
 XyYmCURT4GW6P6ew6BgF2ylK/+uhwjIlgN6aaZ7Pzdp0bt2lPvKzFb+rX47jhI0XTlwB
 W3SaOfQHkaOHHCIpsqQqG57jkWC1Dl52pB5PGpcR0Sau6xYefwskTmXNuH8CXCX9MK+A
 41nITgNnzJ0xoAkWgatllGKlTgUZI9H6nd5dI5jxvSQfj56scXisDkBUeiwuxHXvhwrW
 MaNE0KrJEMS2P/09t2E/ng0jgLuV/TraAlOF2HIu96aGvw228Aylx+sMHjnXJ/lfOYHK
 mLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ugHrK80HET8DZ+f74WXVZ6NolmaYIO5eOQX+LhNJahg=;
 b=ZKnMkesizQARVhZmA4STXxVlsM/tpS4NMsGvXoa2MiKhBc47KPS413pRMAmP8bC+R1
 f9+Az5oK2NDUi1y57+x1LInrNRSMFSobUo+eOQbzBkgVol20qAUBKoQTgiA075sOUvir
 SiFJcpGIsFF/tHlZoyq67IW5YhaMC/v6QdU49L446x/PbsiDXwEcjnkr1UbhoHPh9blW
 QnY3ry9by3aYAS3EeqMpFb0iqUasciZfcRAXIjbLUOHYSglXBB6jTFYSkLhcap3Flf97
 JXEVYU/rNnLazw3c9IqdWEqWj4rmY2SpnrdoohJJ4GIKDAaodcBO3Ohf1+KbpjDFh+ZG
 ZsSw==
X-Gm-Message-State: AOAM532hbZUqrGoGz/KWgd7x+XFGnsegxXInwY0/s9brJoIIfOljh0Db
 U3gmAYQhhXvBFsV5a9UrmcBq5A==
X-Google-Smtp-Source: ABdhPJzlGM7+aVhd+ESPeY+mOcfoNjBXue9ITUmk62M2qek0XavekfwVYbwwMPo/YwS+kAvuUXPAqA==
X-Received: by 2002:a7b:c381:0:b0:37b:e01f:c1c0 with SMTP id
 s1-20020a7bc381000000b0037be01fc1c0mr15024216wmj.98.1648133722411; 
 Thu, 24 Mar 2022 07:55:22 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 f7-20020a1cc907000000b0038c756fe683sm6202357wmb.43.2022.03.24.07.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 07:55:21 -0700 (PDT)
Date: Thu, 24 Mar 2022 14:55:19 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jakob Koschel <jakobkoschel@gmail.com>
Subject: Re: [PATCH] backlight: replace usage of found with dedicated list
 iterator variable
Message-ID: <20220324145519.lcalgtmw3ih4y4li@maple.lan>
References: <20220324070608.57057-1-jakobkoschel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220324070608.57057-1-jakobkoschel@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>,
 Lee Jones <lee.jones@linaro.org>, Mike Rapoport <rppt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 24, 2022 at 08:06:08AM +0100, Jakob Koschel wrote:
> To move the list iterator variable into the list_for_each_entry_*()
> macro in the future it should be avoided to use the list iterator
> variable after the loop body.
> 
> To *never* use the list iterator variable after the loop it was
> concluded to use a separate iterator variable instead of a
> found boolean [1].
> 
> This removes the need to use a found variable and simply checking if
> the variable was set, can determine if the break/goto was hit.
> 
> Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/
> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
