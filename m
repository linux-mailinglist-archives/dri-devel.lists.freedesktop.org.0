Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C0B3FE39B
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 22:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B8676E252;
	Wed,  1 Sep 2021 20:19:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A236E252
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 20:19:08 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id 22so877806qkg.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Sep 2021 13:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:subject:to:cc:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=iDwVaPK9X9X7QqzlEWrxBrm4lRKmxDVWpkSHqBeXa6Q=;
 b=jb6vhiVbOjJj3RHow243t+jTzPnCGOtF1VUzxd+TY3SQLlY5yUtFL/+JWFWNjmoSaI
 r/1kcAwSP20TYzCHqIPofu02SV+6X1o96IZAcV4ySBuEtDqNPvBtd7woi2oWcPZvV7Jm
 3FxpoYzzrNVUn1E/N17S6loynm1JTrSa/j0HjSkMwItFCw0iR3/4go3v/ULTzcv7Mh95
 qKMYL3DxPb3M0unAGxe5cBW9yOtDMVYISOGbQKXIuyee90RnYkRCKzfIX4Uj5xJElK7y
 hNpxj7LQ6svkOT4Is9Y3vbru8IP/7Y1j0YG+s3PU20ufXINCLQ7QGoCTsy0lSH0D0vDN
 aMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=iDwVaPK9X9X7QqzlEWrxBrm4lRKmxDVWpkSHqBeXa6Q=;
 b=ErkxlnXBcC4DL/KTwpdDY5k7ItUNSUd2LLDjMXCrYhEpR+tOvVpab78qZRr9NEsdyf
 +xAsX/9DC/r9hQfyspS6EaCFvrYibKEt5oiF1SRv2OA5uqDDvCytrv0zfpupnCJvzuuF
 LbwhuHjL78M29LrRHQnPF6KPZ9/ywSY6hnAwHrBSbukAq1p1C8jUw2t73HnVPVqjndeb
 Hcmfh4sPr4/8A2NsujECa7eMeVWuDSDTjDNPmy6tiQIHytREHyl/z/ifbpDLTQESeYRZ
 fQ75gqtdRUc681vJsx67KE6wlrKjHyaEa/n1rUyCo+xhA2AA8kiQPH8wFWSpBPVB7VvL
 O6Cw==
X-Gm-Message-State: AOAM532A9dJmJpsBqKJ4jcWWFGPWcRcR3KcmX1LsdogT03efLD+Y2YPl
 KfRIyZaa44C3lJl8Otw4QvI=
X-Google-Smtp-Source: ABdhPJzvpjXETWwxlLwjFzzhQrEHOCRNK3UAY3FTqH8Sn4TtHSDf77Aabons5yT0/ngs+sKTkxi/ig==
X-Received: by 2002:a05:620a:b0f:: with SMTP id
 t15mr1470344qkg.352.1630527547450; 
 Wed, 01 Sep 2021 13:19:07 -0700 (PDT)
Received: from [192.168.15.5] ([186.204.255.226])
 by smtp.gmail.com with ESMTPSA id 191sm472080qkh.81.2021.09.01.13.19.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 13:19:07 -0700 (PDT)
From: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Subject: VKMS: New plane formats
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 hamohammed.sa@gmail.com, daniel@ffwll.ch, airlied@linux.ie
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <d1ceaa32-e143-8d3c-4bfb-7b31673cc76c@gmail.com>
Date: Wed, 1 Sep 2021 17:19:03 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I'm working to add new plane formats to vkms. But I don't know what 
should be the behavior in the situation that we received multiple planes 
with different formats from the users-space.

For example, if the user chooses:
- DRM_FORMAT_ARGB16161616 to the primary plane
- DRM_FORMAT_ARGB8888 to the cursor
- DRM_FORMAT_YUV42 to the overlay

What should be the output format that will be used to calculate the crc? 
DRM_FORMAT_ARGB16161616?

My idea was to convert all the planes to the primary, but I'm not sure 
if it is the right approach.

Best regards,
---
Igor M. A. Torrente
