Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B06C1D996
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 23:38:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EBD010E862;
	Wed, 29 Oct 2025 22:38:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="EaK/CoKt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f100.google.com (mail-oo1-f100.google.com
 [209.85.161.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A39F10E862
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 22:38:54 +0000 (UTC)
Received: by mail-oo1-f100.google.com with SMTP id
 006d021491bc7-65363319bacso186082eaf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 15:38:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761777533; x=1762382333;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :dkim-signature:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qy1+fiy5vVG6Fgi2325/mnWQkrttmVDQVIUSqg+HoGM=;
 b=dYKmN6oyypiXfVwbjpzeRvQ9oRvVaDLlm6i9IbOp340BS1uKvTPtLOCxyKs0VePnE4
 m5WxU72+Bd3M5lRwJv+wkt/XiFk1Ju1MWIcqXgDQIWwkVdMacNlKiOrRCfHeulus/EgP
 fh9zMZZYcjQCHQ0JM8rZPBNVm4Tv4AgN2f8XflrXXq2jQTSQZYmlpWiPDRfxaunCUNuD
 zupQIYTjvlC98WGY0nZMXJC4kA6R0XHNv6KmjOsa4iCwcS39URBhlj1r5EWDUOe15uhT
 q1M7okZFNWct/6MZOVB4HHNTM+JScfK9i9w459crobEp4NGTcfibY2Mmts6kq7CdLv8a
 9IeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWakcygnGahjvsMAYgyn0IYdJ6on9/y9C3DVqF3WUCvpARxnleM4QYFOm+hSowlpYa2Tzu1TZVdjJA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBnaooumF6tZSk4wqWqDRUt+VL+BO6tI0m8McprPsMS9+ifzXC
 UIrF5Q956wWm/PNTMQ/g7CTXcZb5Ovu1+PHj8kKPT15Sb0fYwqObKKLeFTfA5hoMrL/h6a4Hq1i
 O0QVILFLmum7c0mt7Q+u61oiB1mUVF5W3vCtDicK7eJtSPnoUk3qdXLvsh7sHKyKSPeAJ6yQ1+m
 00yfSKSU8RpWg2fX7AU5sgGLIgD/zsVcUnHOeagDeHfIWuNfQ/goyw0keqcn6lOLW1WB+9cnFyF
 nI5a3TQLFBKPsvY/rv5WOx9dye9
X-Gm-Gg: ASbGncsMR6yXL/C4l2RlU678OCZSERwRyKja4Ql/mnH6ZJbUUjnYjydfXFzLMryKXEw
 LUgKBrmpQ6D5J5tbrfwqsuxFa2ahdia3ht0fGN4o00rgyzGhFU8qn4GRnEZ/19BMcJ4Nz+YHIA5
 cI9JRNcwqOcV3tlxOHmh3827LTZwxzKNcNY2MiObCfjR0OQE1DXj8Zl+84w9/H+I4AVN6ZuaXOY
 wXtqMG8njAKOadv26q820fXlGAcjnjOxYBzGAnwSDfAIeYCoq02h1Gp1h3zJz9Y9IsRzezaWPGV
 WiKmTz/1SfloKfkQs1POuyU9RA8cj2roSMDaW2xwSGyOI+RVgN5tYwuU2yufKZwJdn/E1qwBTON
 hGV3i/Oua5vgThy2TC9w/ZmbWIMr5eDzXcEw6dv/mnfkO1oV2FAWQ/Gf/N2aBFtKL3QQ3wDJ61s
 2AO/jfUZsbLsgOThJWPoM1kc0ZjcT2DQCzAnpRE/N/5Q==
X-Google-Smtp-Source: AGHT+IFfsykh6HhIk+3CK2d7e2Yxys50Cp14XxH2wOQCo82fuLf6GbByFnxvVLo9iBmHZyJARU7ntCRbeA8e
X-Received: by 2002:a05:6808:1b10:b0:44d:b213:181 with SMTP id
 5614622812f47-44f89e6a3c4mr386821b6e.36.1761777533176; 
 Wed, 29 Oct 2025 15:38:53 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-101.dlp.protect.broadcom.com. [144.49.247.101])
 by smtp-relay.gmail.com with ESMTPS id
 586e51a60fabf-3d1e3a5ce6csm1318987fac.17.2025.10.29.15.38.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 Oct 2025 15:38:53 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4e892acc0b3so7505351cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 15:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1761777531; x=1762382331;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Qy1+fiy5vVG6Fgi2325/mnWQkrttmVDQVIUSqg+HoGM=;
 b=EaK/CoKtMHyYjZaJXBDvdOx32tzpUG47Ilhwf+Q+x4E3cU+Omzqw36GbndpQcg/irF
 WTriBxEMIBZJPa8ZDHX4rirunIp2Gpy+tcfenG7QrMbX/04ROj4stTSWNbAFEnLyKAt2
 MSumLlzUVdCO+XX2hIPP0nkbO1pfGC3Oqxff4=
X-Forwarded-Encrypted: i=1;
 AJvYcCUsvgd4Z0L5gMpvoritee9D0xQJXDvYK6SzzzcLqOkQkvROI7laGy6MzqONfbRbkIvE56QpVy4Q5Qo=@lists.freedesktop.org
X-Received: by 2002:a05:620a:6914:b0:893:31da:1028 with SMTP id
 af79cd13be357-8aa2eb026a3mr185652285a.90.1761777531019; 
 Wed, 29 Oct 2025 15:38:51 -0700 (PDT)
X-Received: by 2002:a05:620a:6914:b0:893:31da:1028 with SMTP id
 af79cd13be357-8aa2eb026a3mr185649785a.90.1761777530551; 
 Wed, 29 Oct 2025 15:38:50 -0700 (PDT)
Received: from [10.211.247.102] ([192.19.50.250])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-89f2421fc63sm1138624485a.3.2025.10.29.15.38.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 15:38:49 -0700 (PDT)
Message-ID: <f13ddd19-15c4-4a03-b779-a7e943488ebd@broadcom.com>
Date: Wed, 29 Oct 2025 15:43:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vmwgfx: Restore Guest-Backed only cursor plane support
To: Ian Forbes <ian.forbes@broadcom.com>, dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com
References: <20251029141619.28964-1-ian.forbes@broadcom.com>
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Content-Language: en-US
In-Reply-To: <20251029141619.28964-1-ian.forbes@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
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

LGTM!

Reviewed-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>

-- 
Maaz Mombasawala <maaz.mombasawala@broadcom.com>
