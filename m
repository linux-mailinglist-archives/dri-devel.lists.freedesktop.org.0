Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B07649439
	for <lists+dri-devel@lfdr.de>; Sun, 11 Dec 2022 13:45:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A13710E119;
	Sun, 11 Dec 2022 12:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE25F10E119
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Dec 2022 12:44:58 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 fa4-20020a17090af0c400b002198d1328a0so11776136pjb.0
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Dec 2022 04:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/BIynU2NWG7vKdIOfvZ+4asmhXgFyDxZr8sjMOqoFm8=;
 b=VLTR7S/5ahNq29JrLlj5T02niU5r0jRh5WDqvlUJIfcTSpIEpzp81s8kGrBPHDXP0B
 tOZN0FlJjcKYQwFlxGliUGZTkgXsKcQc3RbSg3t9HqcCLJ2sYbN65lsRdjEv4d3Ieipd
 /++8MJEOed7jHqmpcLZRBpL6fxIgF5bnecqhSUejVteb9/vPQW06qcwOHn0sok3JZoOO
 js6Jk/GGYyV3M2lHhJ5Tae1CGHfTY8+Nvz1idEjTvRwOEq++Zj4MFSLqu8XwLTqyxX8c
 v8dbXeurnS/gLdxLUrM/xLQhp8LQwFg2BTGpf47mhbi20bXhzX+IdV9hoRhu5vfwW1qM
 fKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/BIynU2NWG7vKdIOfvZ+4asmhXgFyDxZr8sjMOqoFm8=;
 b=2oVyTandUnwR1RGzdVu1cihVLiVYD793ogjuh3av0mfr7hRUbmcS9vmbRGIFJ0IbDt
 IuOyvjYHr81FLAMC+TV/T7OsXRRTQdzxFCDdDQVeCLUxuwmp2eM9FIioSGYTiMVcqzhl
 v5c32Edtth+aSWFAqfF8M/d657hxvvhWUY5nGZ600gjVkPIpV4d5LBuLRx2Qog8xnphe
 zOL81+lUOoFOeiHfjrW3nCEZyufsxlOUvf0XQoJClC44c+XtLhH51lpelVXNHR8P8Mgf
 ovUUzKz9oN/H8pe000J3A15ZWrvZDjPX4evJgbuoZCNYW1wgQrVuPPRpJXYZT1UGELo+
 ZQng==
X-Gm-Message-State: ANoB5pkShlCswx9kek89xXw4E8PK59NbzXKmxTUZFAs1LY/UPsGyYh6r
 L1NGHI7uWkCecHLNH4dxJ88=
X-Google-Smtp-Source: AA0mqf7yK/8RDsOO7DyGcjv6lNtY/SWehdEVnXgQu3jHlPDi09fOM7Wba1DgYdpDPCZKOaXs9yAeeA==
X-Received: by 2002:a05:6a20:ce4a:b0:a4:69a2:6dd7 with SMTP id
 id10-20020a056a20ce4a00b000a469a26dd7mr15160149pzb.0.1670762698199; 
 Sun, 11 Dec 2022 04:44:58 -0800 (PST)
Received: from [192.168.43.80] (subs03-180-214-233-66.three.co.id.
 [180.214.233.66]) by smtp.gmail.com with ESMTPSA id
 w15-20020a17090a4f4f00b00218fb3bec27sm3620808pjl.56.2022.12.11.04.44.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Dec 2022 04:44:57 -0800 (PST)
Message-ID: <38ad5cab-bcb1-bb23-b141-7ffc07acde78@gmail.com>
Date: Sun, 11 Dec 2022 19:44:50 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] Documentation: gpu: vc4: add blank line separator before
 KUnit code block
Content-Language: en-US
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev
References: <202212102116.A10vg3jG-lkp@intel.com>
 <20221211053051.18125-1-bagasdotme@gmail.com>
 <fb978a9e-43af-865a-00c6-d98499414ec5@igalia.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <fb978a9e-43af-865a-00c6-d98499414ec5@igalia.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/11/22 18:32, Maíra Canal wrote:
> I believe Maxime fixed this issue on [1], but it hasn't been yet merged
> into drm-misc-next.
> 
> [1]
> https://lore.kernel.org/dri-devel/20221208094727.2848310-1-maxime@cerno.tech/
> 

Ah! I don't see that!

Thanks anyway.

-- 
An old man doll... just what I always wanted! - Clara

