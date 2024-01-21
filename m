Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 652DF835555
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jan 2024 11:54:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD9B10E200;
	Sun, 21 Jan 2024 10:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDB0A10E19D
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jan 2024 08:46:15 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-6dbce74f917so359077b3a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jan 2024 00:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705826715; x=1706431515; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tRVY90DXFeCsRMkbLLx8GZvJVtUM/3xiOVfvH3I01KQ=;
 b=GdrPsn/OhpvTXr3Pke4o8xsJP0Zu17fUFcMDk3DfaY0Q+4ndglxpibKsOoAmMU2txx
 NtN3v4qUxI6QHoc1TjI28CNyTl2S1DEMCIPG3/EIlheze9VLkB2fLjgDJhX3wFXF63gV
 LLkKW4VX3YJ0uZb/QZxgNh1b6/Nr4yqdCqp7KRNF/3prGS2SXrdGyn+bfh0z0zGX1102
 aHQ+glg9plmYOYxXW/QIvl8SGPt7QAEZUSLhjYuuaFCSNSyPjNeVFXcixc2KQMfC6/Yi
 GewasgahoF/Lv/N/wqEHfhghcu6Zvas9DIhG5ya9IwoxbzV+9BxB0O6y832/m/hHbN2P
 Qc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705826715; x=1706431515;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tRVY90DXFeCsRMkbLLx8GZvJVtUM/3xiOVfvH3I01KQ=;
 b=ev1/lred9y91Excf7O9KdlX3tlvIKp/yyDOtJXTqBxXldOq3u9jAEW7iGuRaZ9EnNm
 KpQXjhu31ELjVuIwR8UwmiYwINyH3yG02qDjfGCGbMxLpfTRgT6EnLRlLiiSzmNsOhGf
 jGNOy/P7DBdeFdTNovufX5jdc59DAFfNMK55Ws0OguqotztL+eyzoqDU+Eg/KYkiFpL4
 5OCKtJd8+6rL9gIXCFbO38IctKwuRYTlwfR6ge4scnAJprogvTT3wAWj54qNL8Mwl1fk
 RX1e66V91ZtUJNk2SwJtCiTOE7SC5hbzoMCVI7YnsWsdp7U+Sf1rtlH1HvZG62Zs7uol
 WyRw==
X-Gm-Message-State: AOJu0Yyw2Hlc/48MvrFHx+Xv64XfspXqvELX2OVU1G04VIbGVUR5A+ZO
 YAMLKTADmrSSbyEaJkcYj3cGsF55InyaNydKyzCuMm/dxOAwVqMM
X-Google-Smtp-Source: AGHT+IEPPTwHjiv1s79TLMoKupyNvqbTk4lB+l0ghYl2tX6cBUhZQyqjQAHy7DHSQ7ANNPh7it6fPw==
X-Received: by 2002:a05:6a20:7f86:b0:19a:df59:4e8c with SMTP id
 d6-20020a056a207f8600b0019adf594e8cmr1028757pzj.80.1705826714906; 
 Sun, 21 Jan 2024 00:45:14 -0800 (PST)
Received: from [192.168.100.35] (173-255-214-117.ip.linodeusercontent.com.
 [173.255.214.117]) by smtp.googlemail.com with ESMTPSA id
 jj14-20020a170903048e00b001d7273e380fsm2829959plb.153.2024.01.21.00.45.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Jan 2024 00:45:13 -0800 (PST)
Message-ID: <d3eb3764-dc5f-4df2-a914-b377821c787c@gmail.com>
Date: Sun, 21 Jan 2024 16:45:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm/loongson: Error out if no VRAM detected
To: Sui JIngfeng <sui.jingfeng@linux.dev>,
 Huacai Chen <chenhuacai@loongson.cn>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Huacai Chen <chenhuacai@kernel.org>
References: <20240119104049.335449-1-chenhuacai@loongson.cn>
 <1ead2284-dbc1-4938-bdce-66971c70ef1e@linux.dev>
 <4144ea1c-f500-43b6-8641-ea21acae3376@gmail.com>
 <5c5963ff-a534-48cc-8f9f-f4fdf148a78b@linux.dev>
Content-Language: en-US
From: yetist <yetist@gmail.com>
In-Reply-To: <5c5963ff-a534-48cc-8f9f-f4fdf148a78b@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 21 Jan 2024 10:54:13 +0000
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
Cc: "loongson-kernel@lists.loongnix.cn" <loongson-kernel@lists.loongnix.cn>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

在 2024/1/21 05:09, Sui JIngfeng 写道:
> Hi,
>
>
> On 2024/1/21 00:07, yetist wrote:
>> Without this patch, my server cannot start the DM. It is a Loongson 
>> 3C5000L server, with both a Loongson display controller and an ASPEED 
>> graphics card.
>>
>>   $ lspci |grep VGA
>>   0000:00:06.1 VGA Compatible Controller: Loongson Technology LLC DC 
>> (Display Controller) (rev 01)
>>   0000:03:00.0 VGA-compatible controller: ASPEED Technology, Inc. 
>> ASPEED Graphics Family (revision 41)
>>
>> When not working, there is the following information in dmesg:
>>
>>   loongson 0000:00:06.1: [drm] Private vram start: 0xe00472a6000, 
>> size: 0MiB
>>   Loongson 0000:00:06.1: [drm] *Error* Request (0MiB) failed
>>
>>
>> Anyway, this patch works fine with my server now, thank you.
>>
>
> Does the sever you are using has a dedicated VRAM for the 0000:00:06.1?
>
This hardware has no VRAM.

