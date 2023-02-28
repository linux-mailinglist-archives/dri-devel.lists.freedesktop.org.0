Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B082D6A53FE
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 08:59:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 182B710E4AA;
	Tue, 28 Feb 2023 07:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB90B10E4AA
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 07:59:30 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id bh1so9504728plb.11
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 23:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677571170;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uXTYFo40FyvmsbZ+pLf8ZZB+7BCz0ihNHXxTIcIpDNs=;
 b=RVeSBRzbOa+EuQqmVJXUTPHOpSwhYuvUC/pM3VLqWIQBHBDw6fuRzLgmVhQS0ndwlJ
 MoDg85fddy+3aEjTGHErwr4n7JU11ZbgFi+WkHzecd+zRBNR11QuiiWAnQde06TWV+hp
 3W/N0ZAzMNPD1ulM+E8C6Kjj53QvTfwpST9PnMBAb9HC8zdx1e4PEgS7Be2lX+dnO2jj
 pUo540b0IISYEQO6JqEMpcmXrKDPhsY5zm3DYFs+99awZLUR7rV/59Tc8dHsXr43zE0t
 wI02jl9tyOh+/FcV3bPVsCGTwtiyvKH+yBG7iXROXsfNXUekN98XInqsBNehOP5FhdR2
 zSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677571170;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uXTYFo40FyvmsbZ+pLf8ZZB+7BCz0ihNHXxTIcIpDNs=;
 b=jLXtgSHeZ44e0riY+dNCVUsPkbWhZ5U9JeZH6JDQiZYKOM3j96/BMrTFzLtp9UzZKU
 3w684ruf1/Dyq7yn2nsmnBdNReGW44jY/vLzzLKumqy+EALzNJQAVXQi8LJqswsoIIDN
 eenTAGPEyZZhcgmdKkayncEFOoHMh0UJfY00M1PidBjW0ReVSsMEjjdcAemBcOZ+ZQz4
 yFBlD37hyQFTXOdGZyfAQbNt0dNmzb/gjEHrLanqxiKlHBRngF9VrKeh4rYuVhj/4Btm
 2NNYJB7Ga/eOLybraJkc/GrJkD7Eltb9HYOvCNS7Z7Dgh1/BE2j7O8lleM24z4N/3vCU
 SMIg==
X-Gm-Message-State: AO0yUKUQOQIaVBDrSl+Cvnl0NPCeLyhd5nlldvTQG59fOrS1PLfqzZ5j
 3jmjoj/nlH+2lCUCObtOmz0=
X-Google-Smtp-Source: AK7set/eBaP+MaZDFG1k/pZohuSQ5/nA7B3iCLgoKqKaj9TNgHwIMwVMLk1B1qx7hRKNAhESTqGYzw==
X-Received: by 2002:a17:90a:3ec7:b0:234:106a:3490 with SMTP id
 k65-20020a17090a3ec700b00234106a3490mr2374093pjc.40.1677571170373; 
 Mon, 27 Feb 2023 23:59:30 -0800 (PST)
Received: from [192.168.43.80] (subs02-180-214-232-86.three.co.id.
 [180.214.232.86]) by smtp.gmail.com with ESMTPSA id
 fz2-20020a17090b024200b00233aeec339fsm7487535pjb.1.2023.02.27.23.59.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 23:59:29 -0800 (PST)
Message-ID: <9f26074a-ee21-846a-46a3-072cc0630b4e@gmail.com>
Date: Tue, 28 Feb 2023 14:59:23 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] Documentation: gpu: add acceleration node section
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, ogabbay@kernel.org
References: <7799513f0fb5aee27b64752c037980471be669c5.1677120686.git.self@dylanle.dev>
 <Y/bqtlbnWkKMIJI4@debian.me>
 <CAOCk7NrAKZ2G-VbQW3MJUZmkKkO1Ccrs2wo12kg6QHysH-d=Yg@mail.gmail.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <CAOCk7NrAKZ2G-VbQW3MJUZmkKkO1Ccrs2wo12kg6QHysH-d=Yg@mail.gmail.com>
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
Cc: Dylan Le <self@dylanle.dev>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Shuah Khan <skhan@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/27/23 23:43, Jeffrey Hugo wrote:
> I'm thinking the drm_file.h reference is broken.  I suspect it should
> reference Documentation/accel/index.rst
> 

I think so, but since the doc tree above only contains "Introduction"
doc, the reference should be that doc, right?

-- 
An old man doll... just what I always wanted! - Clara

