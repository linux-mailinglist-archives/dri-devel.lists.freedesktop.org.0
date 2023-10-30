Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B095F7DB910
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 12:36:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED2B10E299;
	Mon, 30 Oct 2023 11:36:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA2010E299
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 11:36:45 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6bd73395bceso3047463b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 04:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698665805; x=1699270605; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vM7UrmexBzhlrtYGq+WTsMhMVaGhrgekLL9dJWIZR04=;
 b=EejlWWr1NAlYdJxVEQ9TSe8rtIq3YUGIRtm7h0DoC/vOx6DxZWWqOJn9Wc2e43n0fK
 Fn83yAboA9mANNq8wiR1AJWYyENDcNYBtAHp7VhlU6D6fr5HUeTSiSvG/YRqN89Ds4wF
 2PZ34qgkV2oD2P5Sh6XsgHf/6yh/1fE0EI8nb7FbPwGWkb/WDpq1xiLAxVUeCrgSMlDr
 +Of8q7obykRW2sV2nEjOwrPMYdyG/XNxTUKMcunTWH0H3PNGxhGDDDE6slH8Vni7FDkt
 kvDiVn72BJxETR1CeSjw+EfzeqkLfQBvm17DSDUfFTkygHSzrLLW+IcqSw/2dW/g2cmA
 y3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698665805; x=1699270605;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vM7UrmexBzhlrtYGq+WTsMhMVaGhrgekLL9dJWIZR04=;
 b=WKMpvLTPwFHP0CBQ7tiXFFIHgDVsAxqnoTAnIUi/sxH+i+8Z0GziA8ywppGF+hpg9K
 giwiSD3CWsiQsCBwyRW3ZYkQ/bV0wmuBDpjzCLyKD/jl9OTpAP0Hwl0w16VbguDry3s/
 D9SfCT++/gv3C2E2HMpzZbNu117NQDQwZ6MJkxuWC08KwFTEHxOjKHcmRRFS5SsLKtCo
 0SA6EBb1PW7xF/zuTDsYXUoF6plhDabp06eyOPxtbiHhzlpyqvdIP5JK2t3jFIIkgR6E
 pcZCPKmTyni7hZhTMN6kRqDjldgn47xxpQFkXJWJDuI63EH9caV5hWGfeb3Y0+KCGmo/
 GUsw==
X-Gm-Message-State: AOJu0YyjKUBRC1o9AwrCne5CANSsDBjWpYVvVzOPSwMgVGS3itHxML8u
 aprfyt1d1YQH3VTH1sUEAzI=
X-Google-Smtp-Source: AGHT+IHB04Y3v0cpysF5Hffjhog9NL2AkKNDPwW89qQDZuAcCybJS+Ey+vqecfyEm8jG0xY2kLZT+Q==
X-Received: by 2002:a05:6a00:148c:b0:693:43b5:aaf3 with SMTP id
 v12-20020a056a00148c00b0069343b5aaf3mr12536513pfu.13.1698665804989; 
 Mon, 30 Oct 2023 04:36:44 -0700 (PDT)
Received: from [192.168.0.106] ([103.131.18.64])
 by smtp.gmail.com with ESMTPSA id
 a18-20020aa78652000000b006be484e5b9bsm5725923pfo.58.2023.10.30.04.36.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Oct 2023 04:36:44 -0700 (PDT)
Message-ID: <3f1fdfa2-e30b-42c6-b290-bb02283b3589@gmail.com>
Date: Mon, 30 Oct 2023 18:36:34 +0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH Resend] Fix line Length
To: Julia Lawall <julia.lawall@inria.fr>
References: <20231029144312.5895-1-dorine.a.tipo@gmail.com>
 <alpine.DEB.2.22.394.2310291610030.3136@hadrien> <ZT7v39jG4WTxPYjm@debian.me>
 <alpine.DEB.2.22.394.2310300712310.3533@hadrien>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2310300712310.3533@hadrien>
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
Cc: Daniel Stone <daniels@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Linux Outreachy <outreachy@lists.linux.dev>,
 Greg KH <gregkh@linuxfoundation.org>, Nick Terrell <terrelln@fb.com>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Helen Koike <helen.koike@collabora.com>, Dorine Tipo <dorine.a.tipo@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/10/2023 13:12, Julia Lawall wrote:
> 
> 
> On Mon, 30 Oct 2023, Bagas Sanjaya wrote:
> 
>> Hi Julia,
>>
>> The submitter touched one of CI scripts for the DRM subsystem. To test
>> this patch, there must be a way to run these scripts locally (which
>> may requires non-trivial setup).
>>
>> Cc'ed DRM maintainers.
> 
> There is a DRM outreachy project.  I think that motivated this patch.
> 

OK, thanks!

-- 
An old man doll... just what I always wanted! - Clara

