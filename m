Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D782627CC
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 09:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C43716E9CF;
	Wed,  9 Sep 2020 07:04:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5AD06E90E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 02:34:27 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id w3so1490672ljo.5
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 19:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4v8thHze86+0fQkgmgDPrca03PKESMYxAe79p6ykY10=;
 b=L1vfvgtxXWe9GvH71WbGE8LiHvfYySKBvAXSskIS1QFJd5mk5RoQmbAUtRoJHevcHc
 BkkKfIpTH0L+fSD+QBUlNn4JDcvWrWZRSX3SyMqMAxlcdm7LQ5yueayqecUcPfPDZm1W
 4a5E3n5rekkfozc/SrqcXBqoWgXTLigx4oLCXXKyV85YX1ewNOlvaNsASesu/i/3sc/D
 st35+8pWcyu5cV53IpWHzcQjWvj0cLA40jVuUZd+Dqb0zGq1DLujqapcVRJLy7X+wDI+
 7VDjdf0DDrMQH2cU4nE32/2LU+DnpnnKU+fcinUuWiEk7MXaOGMSZsE2e02M59quXA51
 T5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4v8thHze86+0fQkgmgDPrca03PKESMYxAe79p6ykY10=;
 b=d7KasYPQj2A1FMzYw9RT9d3nB7EycKtfYOZMJx/eAvnC6ZtYbxlhSD7tbsvKMKlzFB
 fuMcAQefWYvHGFJ8KGlX7OS1INjK9efsDLwFbH1JBwwPZjRoajGrWccLDslE2l8CQ3q4
 8SZiPJzGqdqVKg1oAfA1vZo56QF1Je3jENlOYZKd/WxPXPHGXGj9eg/pZbPrfBDTd0Th
 DPy+HaS03ND+j7G6ZP3rqj2PoQt+inAuC9ONMAGrwhDzpYN801n8XENI/uUIOfOag25o
 4Dslo62wrWQCrzKZM5Ptr+UC+ceD0Yte/DAqzUxyAMtP95X4NMdVsHa4JSShCvpuOiTj
 8Q4Q==
X-Gm-Message-State: AOAM533u+moiVQcuV2qld6oTF5WQaPvgN9pgxtrO+6o+zC2Swe9w8d1b
 4CKDkmgTRtBKg1yJSQuWyqtc4f2QgbY=
X-Google-Smtp-Source: ABdhPJyQ8O978j2BwXDtCsACjFVSOajxdytGB0n+ocxSnjDn15DvNx79kBZlLpVe0c/5KixBSv6KTA==
X-Received: by 2002:a05:651c:1af:: with SMTP id
 c15mr711349ljn.347.1599618866404; 
 Tue, 08 Sep 2020 19:34:26 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id k10sm358043lja.112.2020.09.08.19.34.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2020 19:34:25 -0700 (PDT)
Subject: Re: [RFC PATCH v2 17/17] WIP: drm/tegra: Implement new UAPI
From: Dmitry Osipenko <digetx@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-18-mperttunen@nvidia.com>
 <11c05ff2-092b-dc40-73a9-c0ec0fa22826@gmail.com>
Message-ID: <3b3b7d35-e96c-1b6e-ddd0-24fd8a9dd5bf@gmail.com>
Date: Wed, 9 Sep 2020 05:34:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <11c05ff2-092b-dc40-73a9-c0ec0fa22826@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 09 Sep 2020 07:04:23 +0000
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDkuMDkuMjAyMCAwNToxMCwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gMDUuMDkuMjAy
MCAxMzozNCwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4+ICsJam9iLT50aW1lb3V0ID0g
bWluKGFyZ3MtPnRpbWVvdXRfdXMgLyAxMDAwLCAxMDAwMFUpOwo+PiArCWlmIChqb2ItPnRpbWVv
dXQgPT0gMCkKPj4gKwkJam9iLT50aW1lb3V0ID0gMTsKPiAKPiBjbGFtcCgpCj4gCgpEb2VzIGl0
IG1ha2Ugc2Vuc2UgdG8gaGF2ZSB0aW1lb3V0IGluIG1pY3Jvc2Vjb25kcz8KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
