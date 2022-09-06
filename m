Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 360E25ADCF3
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 03:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0858D10E542;
	Tue,  6 Sep 2022 01:37:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AEAB10E542
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 01:37:06 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id h188so9276909pgc.12
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 18:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Rliz2J/fL/mT/nveVEiYF2XOZEPNoVbCQ7gKvs6TmIk=;
 b=dyZxo/QNxSEmfklK5GtIfepHhpi/gcIrEQ/36n0Xh43mPKhLod+8VsIZDA/600z5br
 CegJjhn4YMetXny/afIO+CT8u4rOROGbhISNUME6+ve55EOx/bfe/wnFcymzDWGZIgiV
 6410z3Nkmdik728SN0AoVP/B1RWscTOUCDY3Dh+M22sV8brD2Wgo/vNE3ttSlWJkQDNi
 1z/k+a+StVXzGtgBpSb8z6LmTDtgPYSz8X7Cu7VUXTydOwh/s6eTIAF2DXLMkeY8gIgE
 p6VFbzLH6F4YXYwUi1PNnvb3KQAzFzP1izcqFmHqjSHmRH6Lf/pmvxe8P8YcWb7sORd/
 R9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Rliz2J/fL/mT/nveVEiYF2XOZEPNoVbCQ7gKvs6TmIk=;
 b=ENxA8XJ82W82SWksVpvH1reY4agT7wqRyMoOftJVYfHeCJ3b4SYxiefCCztrcqhP5L
 4vGfz5pxdPRb4rlxl2Mbikj904XLgOOQojeU/si8vmYysrWZ0efQM/jPTBK97HVoN9zT
 PLKtCjGTWSe5Ye4GDRISiKwr+wT1NDmrRbGxuk/la+GDi4L+rnEjA+etwbF8ppo3uW+b
 eeqOhl8wroII0JR+uOHDK8uOI7WrK3Hsw8pvA68XEctrmeYbXPmBEefAVrUE1DeiVMB9
 XuwIfZF41yLWhnDTaB6vE1m9L+JjbCNpScIIIM8SRiRKGje0NOu3S3XASSQZ02Asm/0O
 bLPQ==
X-Gm-Message-State: ACgBeo2r0XeSzALAw4UDrBMIOBS9mW1nwMT9PMPjL15UE7TDP1EYiGss
 wxEvzPHnK93l0bTN6KXOxzI=
X-Google-Smtp-Source: AA6agR6GiPB6m9Uu6wCaPkJluTD1w4fYadPNmDx1bmbbFooklisV9LCCT66FaFzn48+loAp3mYDmdg==
X-Received: by 2002:a63:da49:0:b0:434:459:307e with SMTP id
 l9-20020a63da49000000b004340459307emr12360634pgj.105.1662428225949; 
 Mon, 05 Sep 2022 18:37:05 -0700 (PDT)
Received: from [192.168.43.80] (subs03-180-214-233-83.three.co.id.
 [180.214.233.83]) by smtp.gmail.com with ESMTPSA id
 e11-20020a170902784b00b001769ee307d8sm332884pln.59.2022.09.05.18.37.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 18:37:05 -0700 (PDT)
Message-ID: <0131b046-a891-2fae-d2a5-6510455c3449@gmail.com>
Date: Tue, 6 Sep 2022 08:37:00 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] drm/doc: Custom Kconfig for KUnit is no longer needed
Content-Language: en-US
To: =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220905184711.391022-1-michal.winiarski@intel.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20220905184711.391022-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>, David Gow <davidgow@google.com>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/6/22 01:47, Michał Winiarski wrote:
> References: commit 6fc3a8636a7b ("kunit: tool: Enable virtio/PCI by default on UML")

Use Fixes: tag for bugfix patches instead.

-- 
An old man doll... just what I always wanted! - Clara
