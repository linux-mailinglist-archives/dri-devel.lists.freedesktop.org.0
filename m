Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 293322627D3
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 09:04:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63B26E9D0;
	Wed,  9 Sep 2020 07:04:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA7C6E0BA
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 23:36:57 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id c2so1067231ljj.12
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 16:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rDZ8rOIcndqB1/SMUGVo/U3Os5v12RouimNmvPxV4Xw=;
 b=GKvVdr62U4pfIktgOyS+3+xkZ2rmdRFti+rnRYXA4C9+tXCOZ72hAA236ivvM5ej9k
 1yqgsSCodSkObycuxmdYdarWJsx9+hBgI69RX3gg09xR/aiIGAVy5qyiNR7sECHzGYTX
 msPbD/QedNeYkEdJEloVUjjmMXBNPIFoTaTl4YJ2nl441K2Gm6xPE2Qnulu4+++G5y+B
 oLHBXM8k/jy1TNabj1kJHAEQtSbh1z5iiKVbSGP9RnNwS3UJ3vdO0pSLv+Qyi03fqIyu
 7B4WKj0A0HSicLnDNSqOTlYXVd1AdumqLoJ02fpU/aTiiMQNwmwiv7s7HUhg8OMDt8+p
 H/nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rDZ8rOIcndqB1/SMUGVo/U3Os5v12RouimNmvPxV4Xw=;
 b=ozMSMuSwalKcMB1rwZASXV4Oxm99/uLZvwfimmCDx2OQXQI93Iy3KH9oYS7JgJTd8s
 ggbvA07EekzXJ2jDNCWAOUQxRR6YxcUP+YAeTNgEc7XauD48KMQwGQ/GPancLBve1bzO
 bfGMfzhH64VRqFeP2xLYwUjz/lyh+Y6qLb/7s2gGM8pCCOmLL6HXRd8Odfc6EwKi2rpq
 u1wQ+HhnxPV26pIp60VsB7eesUS94Rx0sFUH/GLcY9pWuRMFlsJUbHZESAPimXW6LoY4
 phc2mWjpGwBBLn0MyxsIJgcNjrRl4N5vfgM+mYwfz3xX2ow3yApxDlNrepGUZtRyeEPK
 ptUA==
X-Gm-Message-State: AOAM531fBHaTLavdRLsPGs8DrnbVlgQnX6SW7ohBDEQt5YFa2JRtC3jQ
 KgYOiaDwmcfoJlvB8gfa1RQ=
X-Google-Smtp-Source: ABdhPJwwyI61fyaloH7zxC+FXApjvP+fbC6sWP8BaXoWryLhofJpYHodyvO+esrugOwEnSpa2zFBcw==
X-Received: by 2002:a2e:3506:: with SMTP id z6mr434251ljz.418.1599608216322;
 Tue, 08 Sep 2020 16:36:56 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id t4sm276971ljh.122.2020.09.08.16.36.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2020 16:36:55 -0700 (PDT)
Subject: Re: [RFC PATCH v2 00/17] Host1x/TegraDRM UAPI
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <241b35d2-7033-7744-18bf-7065016ae1f8@gmail.com>
Date: Wed, 9 Sep 2020 02:36:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200905103420.3021852-1-mperttunen@nvidia.com>
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

MDUuMDkuMjAyMCAxMzozNCwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gSGkgYWxsLAo+
IAo+IGhlcmUncyBhIHNlY29uZCByZXZpc2lvbiBvZiB0aGUgSG9zdDF4L1RlZ3JhRFJNIFVBUEkg
cHJvcG9zYWwsCj4gaG9wZWZ1bGx5IHdpdGggbW9zdCBpc3N1ZXMgZnJvbSB2MSByZXNvbHZlZCwg
YW5kIGFsc28gd2l0aAo+IGFuIGltcGxlbWVudGF0aW9uLiBUaGVyZSBhcmUgc3RpbGwgb3BlbiBp
c3N1ZXMgd2l0aCB0aGUKPiBpbXBsZW1lbnRhdGlvbjoKQ291bGQgeW91IHBsZWFzZSBjbGFyaWZ5
IHRoZSBjdXJyZW50IHN0YXR1cyBvZiB0aGUgRE1BIGhlYXBzLiBBcmUgd2UKc3RpbGwgZ29pbmcg
dG8gdXNlIERNQSBoZWFwcz8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
