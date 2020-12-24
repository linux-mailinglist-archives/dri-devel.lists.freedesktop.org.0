Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E7F2E2B03
	for <lists+dri-devel@lfdr.de>; Fri, 25 Dec 2020 10:43:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 714F489C88;
	Fri, 25 Dec 2020 09:42:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 168DE6E8A3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Dec 2020 00:09:22 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id x18so482254pln.6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 16:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ShQbyvevmwHQCLF5QriZyQfBTHOY64tkDvnAKsQzHRw=;
 b=jyzfCdku+WV/8dKfBhR3yqZGTB/uOaB7h4qs5tWLyffyFZK+vUyuCMxL+d/2EGUKoe
 XWLli2CtVPyViUtQuUsfbmFcAxiYcAhwJ5xj7/KB+xl6f9kruTjrmtX+CcftLnlYMdqC
 kIt5knkSbC4VSu8QDcR29ijo7+/NgqPpAP1s1yjwnDZYgiAK8wQCAuWEu9QASGitLAhn
 PKVucU58MyMgERhn2i02/23qaXe7yFEC04FE1/2TKJLNiUePz3JtxD97fSsNqhVl2JhO
 1r6E0LQRJRJuqiQpC+NBNwXgmY1JPUFZejWepjzwec7f6/15/W3mFY/CKSILbgKVH/gI
 iC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ShQbyvevmwHQCLF5QriZyQfBTHOY64tkDvnAKsQzHRw=;
 b=MUfKdw69v37k5a6FeFfRhZ+6fSD4jmvzkFE5Luurb6ELDb9t5YrXaYsoIo8s836ooB
 C9nNJlkKJFq4n08bPfjOXgtam18Pw5UjaICjRxDBAoUd5l/Eq5LBohFpbeax8t9/HnlI
 2pjx5CfaMy/5IehuNNAcpJ1EMGsXgvekGn2wKWY/kWMVbStilykqXLS7lXwZnuRcxmOw
 B3lZFJYul0rszRJUzfo7ECz9qWlEymSHROmbVMLRttAsI7A7excPOgRcL5w6WH2FWPU1
 /YTC9C7t9hioL/OR3oRLXS8FoupXsymzVXZTrSJs2hgvdGuewDub+dhbdq6QjBDbONjH
 3rRA==
X-Gm-Message-State: AOAM532Yvq5JvuMrWuxx5+9T8eAB/xeI667YuytbtajoFl9EaiE283rF
 StQre7mmfH3sM5TR9bOhVdQ=
X-Google-Smtp-Source: ABdhPJyje+K+UO8IX18EP1ygLSNT9RLUzX3foCctMUd55WTAatwxxEOcO4ti+cOEuT8hB/1bLMnZWw==
X-Received: by 2002:a17:90a:bc01:: with SMTP id
 w1mr1815332pjr.173.1608768562617; 
 Wed, 23 Dec 2020 16:09:22 -0800 (PST)
Received: from [10.230.29.27] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id y15sm655320pju.13.2020.12.23.16.09.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Dec 2020 16:09:21 -0800 (PST)
Subject: Re: [PATCH] dt-bindings: bcm2835-vec: Add power-domains property
To: Stefan Wahren <stefan.wahren@i2se.com>, Eric Anholt <eric@anholt.net>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Florian Fainelli <f.fainelli@gmail.com>
References: <1608751473-12343-1-git-send-email-stefan.wahren@i2se.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <32d1873e-16e9-1b5b-f521-ef8f5931b437@gmail.com>
Date: Wed, 23 Dec 2020 16:09:19 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1608751473-12343-1-git-send-email-stefan.wahren@i2se.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 25 Dec 2020 09:42:09 +0000
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
Cc: devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/23/2020 11:24 AM, Stefan Wahren wrote:
> Adding the missing property power-domains to the bcm2835-vec schema to fix
> the following dtbs_check issue:
> 
> vec@7e806000: 'power-domains' does not match any of the regexes: ...
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
