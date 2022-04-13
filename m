Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF034FF483
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 12:15:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A58F10E7C4;
	Wed, 13 Apr 2022 10:15:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F039F10E7C4;
 Wed, 13 Apr 2022 10:15:48 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 u17-20020a05600c211100b0038eaf4cdaaeso3634786wml.1; 
 Wed, 13 Apr 2022 03:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:from
 :subject:content-transfer-encoding;
 bh=5RLZV5mEcx/sKbtQuylTqcwOJ2wKK0AZp+fa1dry9as=;
 b=A00PEyHRpWqF/aVcPeOGJP7Za4cFhk8GecD2av++iydcvQduPHKCrC/zYWa8q0/6JU
 BG+6V2nKJL5A5IsujoyjAQlzXeNALux/sRrFz3/ybYkKbl5p6pVWcEakQk1+FyfvnQPx
 s3S/X3g4vm0lK8HByiNu2bTQaankSkZHSrAmDmrst5ReSUl5KMM7bU2qbwaUUKmfSyI4
 YeRgBViOwKhAYltZXGo3NlB6OSjy8Mbxvz79oSLnXJq1kjyvclhWHNv73PXnakvPlxsc
 TOMPqEqLKCBO2aSdsB+vKF9VipOJuuL2rolTP9CRnUCRE1Npx0R0Xgy9GKZukm7biKtt
 /A0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:from:subject:content-transfer-encoding;
 bh=5RLZV5mEcx/sKbtQuylTqcwOJ2wKK0AZp+fa1dry9as=;
 b=k5t+68fkT90K7cbbtWuVW/eFwgpOeceqn5qKD3SqEq0QNDZKy5q6RDybyLGuAdL0Tg
 DAvszX4qXRIXkmtlAi8bRWvjjg/MNOqWmkh+zD0Ra/YpZF19iekgleQv/wveyk2AUJXc
 mEktoExkF4gt2BQuhfNQoMsN8b1ItUeIvn2qzOXgKxIiZ7cOZRMBjAU53gcOWE3jLBzl
 zjxSwKn3bOM7RNIP1xVyGqdLau2L9PvUDLc7SGyBtgI7ebxY5WqG6gkLLz0i6TBrpcG2
 WWuq7eoWU1RqRmGW5WTVbuVobwPai5VojEAfVq5lZFMLm+q1+YiVjUmb9Lpje33OIjwt
 heIg==
X-Gm-Message-State: AOAM530UAS7c4M5UUqHR9D7eb57njKZWfMSVsFf8dSwwXz5NAPTIpVWZ
 ktv2PZBlaUwjpcmhYgQhqaviltRmUvMu+F+Y
X-Google-Smtp-Source: ABdhPJy93OQoLYidGUphtpyJ/FidzG64BLiWJEP84apl0xJ28s633E6l/jQ+cXE4Ws3qtGeC3BlGaw==
X-Received: by 2002:a7b:c310:0:b0:38c:f07a:e10d with SMTP id
 k16-20020a7bc310000000b0038cf07ae10dmr8154407wmj.110.1649844946895; 
 Wed, 13 Apr 2022 03:15:46 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:be69:3200:82e8:2cff:fe51:d2c8?
 ([2a02:a03f:be69:3200:82e8:2cff:fe51:d2c8])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a05600c19c700b0038cc9aac1a3sm2135868wmq.23.2022.04.13.03.15.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 03:15:46 -0700 (PDT)
Message-ID: <0da21aec-d299-1834-99f3-9a598e4649f7@gmail.com>
Date: Wed, 13 Apr 2022 12:15:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: fr-moderne
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
From: =?UTF-8?Q?Fran=c3=a7ois_Valenduc?= <francoisvalenduc@gmail.com>
Subject: commit 15512021eb3975a8c2366e3883337e252bb0eee5 causes white spots in
 console screens
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Commit 15512021eb3975a8c2366e3883337e252bb0eee5 
(15512021eb3975a8c2366e3883337e252bb0eee5) causes a lof of white spots 
to appears on the right upper corner of all console screens (see 
https://drive.google.com/file/d/13GabEvOIKSAj5yox6ybAZEDu3Ixncw5Q/view). 
git-bisect shows that this is the offending commit and if I revert it, 
the problem goes away. The problem still occurs with kernel 5.18-rc2 and 
to all stable trees where it was applied.
Can somebody explains what happens ?

The video card is the following: VGA compatible controller: Intel 
Corporation WhiskeyLake-U GT2 [UHD Graphics 620] (rev 02) (prog-if 00 
[VGA controller])

Please tell me if you need more info.

Thanks in advance,

François Valenduc




