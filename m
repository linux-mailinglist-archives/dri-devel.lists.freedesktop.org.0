Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A486959FEF1
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 17:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C3AB958D;
	Wed, 24 Aug 2022 15:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF01B9490
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 15:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661356725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Ff1QmPIlyrYnAdXajfzHu5Yv9RSqOuxoN2Oa3D8Yus=;
 b=bVsXOJeO75JREgZF6nVqLvkr+mST/Hd34Ez2MvRyIFxGBLxiZYLzGCnt9Hi1YYpemGjyMr
 hT1TiyaAuO+BvCkoES6gLeT7nXSpRkDuiJgiaGrAIxf0YDI3XMrh43pIsOo39UhRDdaY2o
 /dyLrAZRwz/dghgSqPRrmBft3xaLJ1U=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-661-fwdS3VWMPKaNdGztxQ5fLQ-1; Wed, 24 Aug 2022 11:58:44 -0400
X-MC-Unique: fwdS3VWMPKaNdGztxQ5fLQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 hd35-20020a17090796a300b0073d67a500e6so3379172ejc.7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 08:58:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=6Ff1QmPIlyrYnAdXajfzHu5Yv9RSqOuxoN2Oa3D8Yus=;
 b=6X/IGTUwl06C6ES/0CPqUOI87Xbball8q1FpL33GoYZXNr/woVKa2pf552Tfsi3b4y
 HV74fUZl/KX21lUaSBltHSI2XqqCc7RPRJB7Iv10UBQLxNYWEx8OEYqSJ0jiv5OtfeJQ
 ULSNhiHC/dovKLSPKgyV0CuAAOSoMQWAMXhik1DnxewMbAFjVFZ1eYniojfcBeqvo3QB
 m17ViCIHz8c266MVchumw5Q2sIaZZeL8r6emBpQhzrd/OuUSFXu9c4lOcmqp+pqNuNCE
 lQ5VJiHL3Mp1M5FoNC8v/OdmpUOH1JIBkBrrqFV7xEyADQPHE7h+/zFmKIIfP/nK4LMc
 tU9w==
X-Gm-Message-State: ACgBeo3ZruvZPEyZO6fPSKJowfNvXiOkpHtqIjIGcSoy+QwSU/+LMBeB
 UgNN6fE/x5zO9p6A1OZ7dkbpSkYibAOCm/To2SS76p3CVN6HFirCMdPWv0YLhAti0/+WJZWzIEF
 MsJEy0fGMMZwUR1/p34jWwFmOHIfI
X-Received: by 2002:a17:907:60c7:b0:739:52ba:cbd0 with SMTP id
 hv7-20020a17090760c700b0073952bacbd0mr3379477ejc.152.1661356722619; 
 Wed, 24 Aug 2022 08:58:42 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7GI3i0UedamIoOYIDqmV1E+eiXCyENJwr+fHf8/hxFh8cyg/ZDO32RED6QhINoR/yFqFW+kw==
X-Received: by 2002:a17:907:60c7:b0:739:52ba:cbd0 with SMTP id
 hv7-20020a17090760c700b0073952bacbd0mr3379471ejc.152.1661356722438; 
 Wed, 24 Aug 2022 08:58:42 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b40:2ee8:642:1aff:fe31:a15c?
 ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 bm2-20020a0564020b0200b0044604ad8b41sm3318568edb.23.2022.08.24.08.58.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 08:58:41 -0700 (PDT)
Message-ID: <bd89a246-ee32-7b54-9c9c-7090cc7d51a2@redhat.com>
Date: Wed, 24 Aug 2022 17:58:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH drm-misc-next v2 2/4] drm/vc4: plane: protect device
 resources after removal
To: Maxime Ripard <maxime@cerno.tech>
References: <20220819110849.192037-1-dakr@redhat.com>
 <20220819110849.192037-3-dakr@redhat.com>
 <20220824154823.qu3tdwypg5o3ci4z@houat>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20220824154823.qu3tdwypg5o3ci4z@houat>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: airlied@linux.ie, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 8/24/22 17:48, Maxime Ripard wrote:
>> @@ -1252,12 +1261,17 @@ void vc4_plane_async_set_fb(struct drm_plane *plane, struct drm_framebuffer *fb)
>>   	WARN_ON_ONCE(plane->state->crtc_x < 0 || plane->state->crtc_y < 0);
>>   	addr = bo->dma_addr + fb->offsets[0];
>>   
>> +	if (!drm_dev_enter(plane->dev, &idx))
>> +		return;
>> +
>>   	/* Write the new address into the hardware immediately.  The
>>   	 * scanout will start from this address as soon as the FIFO
>>   	 * needs to refill with pixels.
>>   	 */
>>   	writel(addr, &vc4_state->hw_dlist[vc4_state->ptr0_offset]);
>>   
>> +	drm_dev_exit(idx);
>> +
> 
> You did change the CRTC patch, but the comment to protect the entire
> function also applies to this one.

Yes, I changed this one too, but missed this particular function - gonna 
send a v3.

- Danilo

> 
> Maxime

