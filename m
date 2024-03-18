Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CBE87E5A4
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 10:24:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1079810E013;
	Mon, 18 Mar 2024 09:24:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ADi7DTXC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E1810E013
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 09:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710753844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/N8QI1fD+bgjmIz5nIr2cRdeL0rDB9RnDP3ak0Rbm4Y=;
 b=ADi7DTXCPehcG557R1qB2xSd7LldfUeOQmUDCXMv3m1IAr7uwMnvZwWmW4VtaxEMk4RI+d
 povQV8+CBT35svGVwPQD0k6ld86jqmaenKNxrj/u/H1z5mR/kMYdytAxwhRQtLu/QMxjAp
 tLAEqxlnfbkjHGiTbRn3gBRtgIUGyKo=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-tZG900ZJPpOVR6-C30Ek3Q-1; Mon, 18 Mar 2024 05:24:00 -0400
X-MC-Unique: tZG900ZJPpOVR6-C30Ek3Q-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-513e0c5f399so1381813e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 02:24:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710753839; x=1711358639;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/N8QI1fD+bgjmIz5nIr2cRdeL0rDB9RnDP3ak0Rbm4Y=;
 b=rdgfJjFDD3fs57e1XRh/KGwoG2zr7w3koWiw0/boVLyaJsx7ZH1ConrBE2cAiSsVp7
 sxTE9s6lvHCoruRl5EqqVci0uOkVebsHI55imfz29FtJyiaxn6d7OJocw/DdyIS+Lmy6
 8nf646UhVSeci0VgYW5Uz2rgJxs1lv9g5ULcXoBZgdlMSsDYGioMhOgITQvltBaFhP2h
 mW8YKL0QPZZxsrwhpj374OuETZ/gfLtwfaV55sJTfayZ2+oKq5wzgTCA8B7uqhjrWVNK
 cZxYUpnu2VSjzz/a0tgqpGzgHwRa3rSLZBBS5LMzsJ5eYHmJq1ydpWzfaBoBpgSFlJeT
 DMtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtEZsTWcVh0YbENrt+pfBGY/OVk7M9i334+YAUPSnHHfFzlv02d9DNokqsz7diLKqqYf479ZaiZasV1h3nS4wybw2ZHQ5TAw2/ojx1Oj4z
X-Gm-Message-State: AOJu0YxG0u4Pudu+hmp3/jYXlzrDATejhXm0hFVAna55qf8FqH+ca5kF
 u019x159wT51q7bf3wHEDpHEc4z+UCywtsliMcn3iSI/cSoAsmNUZncVGbHgb0vePSTuuNADEjq
 2EfRUw3pOUxcHwIfbHvExnDankkgnXNsTXOMEUUTLWWzf1qHQiYpnZqeit+iYmQMDSQ==
X-Received: by 2002:ac2:5b5e:0:b0:513:d1cd:b902 with SMTP id
 i30-20020ac25b5e000000b00513d1cdb902mr7025555lfp.32.1710753839203; 
 Mon, 18 Mar 2024 02:23:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkd8Us4BsgSEBSOtJqvIraSi5b4WjtSpS7BNTLWU2+C3Ui6W+LGv0gz1InPWlQ6qJvrN+wzw==
X-Received: by 2002:ac2:5b5e:0:b0:513:d1cd:b902 with SMTP id
 i30-20020ac25b5e000000b00513d1cdb902mr7025539lfp.32.1710753838871; 
 Mon, 18 Mar 2024 02:23:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a05600c19c600b0041413546e5bsm1270407wmq.0.2024.03.18.02.23.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 02:23:58 -0700 (PDT)
Message-ID: <20d4da39-8dbc-4593-87b8-308c75c0fa82@redhat.com>
Date: Mon, 18 Mar 2024 10:23:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/43] drm/mgag200: Use fbdev-shmem
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de, javierm@redhat.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
References: <20240312154834.26178-1-tzimmermann@suse.de>
 <20240312154834.26178-13-tzimmermann@suse.de>
 <b35f1b2f-82c1-4c7e-a449-54e29000cfb6@redhat.com>
 <1fb62a54-ee77-46bf-9d38-dcc0ceb37533@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <1fb62a54-ee77-46bf-9d38-dcc0ceb37533@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 18/03/2024 08:56, Thomas Zimmermann wrote:
> Hi
> 
> Am 13.03.24 um 15:03 schrieb Jocelyn Falempe:
>> Hi,
>>
>> Thanks, it looks good to me.
>>
>> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Thanks. Do you still have access to that broken realtime system? I 
> wonder if this patch makes a difference, as there's now one large 
> memcpy() less.

Hi,

Sure, I'll do some latency tests if I can get access to that server again.

Best regards,

> 
> Best regards
> Thomas
> 

