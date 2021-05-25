Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D62CC39031E
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 15:53:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5005B6E13C;
	Tue, 25 May 2021 13:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 849996E13C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 13:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621950776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PW7OrrfjfM61YRapb5tPZf3kCsKbCNzZN/BPGRKNoNU=;
 b=hhsZqvbLUmNdI9nUTEu6pqq0wvEEUdmGPqttIsrdRkyoW0hJ/GH/KRq7J9sISzJgdJ293D
 bqazXXt/2eBPXTdrtPxNaUwtEroJF+iDaqH4Egw5aixQIyJ5OYCCK1nnJzXzMA4TkUOGie
 rIhf5+6ycbO7gffOuxxflGUF/Phfcns=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-K2ue0M4hP7WOf9JNtIE7dw-1; Tue, 25 May 2021 09:52:55 -0400
X-MC-Unique: K2ue0M4hP7WOf9JNtIE7dw-1
Received: by mail-wm1-f70.google.com with SMTP id
 b15-20020a1c1b0f0000b02901869cb157e3so1367560wmb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 06:52:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PW7OrrfjfM61YRapb5tPZf3kCsKbCNzZN/BPGRKNoNU=;
 b=YNBT/fs5N36viKN6BBASabbRDXQhMf1tIDcnbv+AiLoFNWe9Y835dOTpFSfRYbcCfY
 LcqQft6c4ORRHg2EhNuL3rZL9KctuREXQXAzEaS6XL0v7ph5J8i+TiIVDAyvpBOQcrKM
 bRkNgVTI7QfhKnNUls03Z8Dh5glEVLfj4hwYJV961YWTY2Hb6d0nuxmhkc8nDnfXQPeJ
 i5XaPuGFkRp37JFW2yFnlzLG9hTPE16W4FvYU8zt2hMMEHH6SLwOUASHOP7cZAJMEEnx
 Lvl2X4VtC85nCXgevG3CTsBSeqN1jui16H/R2aB/6JCi1QyIN7EDRHRK1lYtSQTmfeMB
 6qSQ==
X-Gm-Message-State: AOAM531EsUaoI+tfkvWcD6LRCHPNzsnX6rLFJLJLhCTw9vKksEpqg9A8
 0+QHwlCRd6zDqCs+aY8E9tUFTg7grlB1VPPN5GF825A+vME+rGQ7XWJ8NE9ROxDlKiKyOWkGbwy
 XhMcuVSRTWLcl4cjxUfmnS3iTeffAsrmdUr3q1cLeofGDcebo9IIUtQP2PXRq3NqrRk6RORDBv5
 40t2A=
X-Received: by 2002:a7b:cc83:: with SMTP id p3mr24768909wma.169.1621950772452; 
 Tue, 25 May 2021 06:52:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoD0S7iFDYWpnFLr+WwG/M35YgaD7ABz77zKNWv7ODMUul6QdqZLBzVMLAVnyvv7vXt1v2ZA==
X-Received: by 2002:a7b:cc83:: with SMTP id p3mr24768893wma.169.1621950772267; 
 Tue, 25 May 2021 06:52:52 -0700 (PDT)
Received: from [192.168.1.101] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id z18sm16767823wro.33.2021.05.25.06.52.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 06:52:51 -0700 (PDT)
Subject: Re: [PATCH] drm/fb-helper: improve DRM fbdev emulation device names
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Peter Robinson <pbrobinson@gmail.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
References: <20210521131910.3000689-1-javierm@redhat.com>
 <YKfS2GDCXPJ/q8gT@phenom.ffwll.local>
 <3a6f9235-5375-b2cb-2d63-a47c5f9752bb@suse.de>
 <bfd6fa47-497a-64bc-c2fc-a081bd41d5ec@redhat.com>
 <fc6540fa-1945-a15d-239d-e87bb4d3fa9e@suse.de>
 <YKz2vbxYXSKQE1Ng@phenom.ffwll.local>
 <4e81ab57-a240-952a-7423-22dc830bc62f@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <79f227c4-5ed6-23e8-2d74-3197871359f8@redhat.com>
Date: Tue, 25 May 2021 15:52:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <4e81ab57-a240-952a-7423-22dc830bc62f@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

Hello,

On 5/25/21 3:34 PM, Thomas Zimmermann wrote:

[snip]

>>
>> If you guys with your distro hats on all think it doesn't matter, then
>> yeah I'm all for dropping the somewhat silly -drm or drmfb suffixes. I
>> think that was just way back so it's easier to know you've loaded the
>> right driver, back when there was both drm and native fbdev drivers
>> around. But now I think for new hw there's only drm, so should be all
>> fine.
> 
> Suse doesn't use fbdev, except for some outliers; most notably hypervfb 
> and generic efifb/vesafb. Both are now being replaced with drm code. 
>  From what I've seen, it's the same for other distros. And X11 checks 
> for the existence of device files anyway IIRC.
Yes, I believe is the same for us.

I'll post a patch to just remove the suffix then. Thanks you both
for the feedback.

> 
> Best regards
> Thomas
> 
>> -Daniel
>>
> 

Best regards,
-- 
Javier Martinez Canillas
Software Engineer
New Platform Technologies Enablement team
RHEL Engineering

