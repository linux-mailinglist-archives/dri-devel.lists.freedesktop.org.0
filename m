Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB07337388
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 14:14:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C796EC6D;
	Thu, 11 Mar 2021 13:14:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2E76EC6C
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 13:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615468444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qZli/5AdqiZ5FCC1sQlc7QOa0InI+iN4q0zJEpQtm7A=;
 b=FOrVewx8HpEOPAUVoHyctJ2L2SqH3HSkyCADd4pcAm8ks64Pnv8ZQsfKw++zGV6+25Jait
 afIlQUT6H1g0Gft5uqV/Jql5I/d6P3ErWXQbOxcdfCS5DzNKoFtg0KMsW+q97hf+VnDMSh
 HxjKKUvI9/kXYJ3rGiqenc0pLTksdbo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-q8YChDIKPi6NaECz-FBRGA-1; Thu, 11 Mar 2021 08:14:00 -0500
X-MC-Unique: q8YChDIKPi6NaECz-FBRGA-1
Received: by mail-ej1-f69.google.com with SMTP id gn30so8601984ejc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 05:14:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qZli/5AdqiZ5FCC1sQlc7QOa0InI+iN4q0zJEpQtm7A=;
 b=MFbPgzpzXGArVbTdo62+1gkMElTXLPQUeVrKC3Plz+Dh8vWm7DPtg15/j3qhQCDiN8
 iWYpVPNQQbsHFs7M8Ipkrox1BBF7sw9QYLO81u1OYwJRPH8IYbxXsFaF1eigN6GWyiZ/
 /dRaD8BcmoAJcGLmhKw1nFTDukZlK4Bw6K54tM80hWJbP8la4yXNTKQQzz9Q/vaEu3jF
 FAtypLGFB0JQIihxTSt38S/yLV4prX4NrnUOYnGFjZfdYFC19orw4XUo/T1XWT7QcSQj
 yUSK4UqRGsVkvh/1dy6pIlOFrpwLCzUvu4k+29WE8lf2GQqAJSO4d51iEWuAAqZbfKKG
 TXYQ==
X-Gm-Message-State: AOAM531p5x7mbjWI7wxwPGM9FnM0pSRjnmD5Oo4bp2qDQlItsfLaevai
 +AI+hD3LQYyKwPZd4vP1FnWFrZx9QmjkVYLCpWF8Mp1ToTQoapgisLFsafRwoicKeEGhNUaB/7S
 FDRSmPAuJuN5UjJM7lDUKWq9+g3JI6Qg1ihYJWgNoZEmtJzZd087tjIRpaNOUfR8YvS15Mzxv3w
 Os/h4n
X-Received: by 2002:a05:6402:304b:: with SMTP id
 bu11mr8141988edb.157.1615468439070; 
 Thu, 11 Mar 2021 05:13:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxoltSnzU0qQGdnEKl1m385+3uhXxZ+W//ZTaG1HDIaUqYJpldXpt5SelPVh8S6WJ/sqh8keQ==
X-Received: by 2002:a05:6402:304b:: with SMTP id
 bu11mr8141967edb.157.1615468438792; 
 Thu, 11 Mar 2021 05:13:58 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id d19sm1307721edr.45.2021.03.11.05.13.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 05:13:58 -0800 (PST)
Subject: Re: [PATCH] drm/vboxvideo: Use managed VRAM-helper initialization
To: Daniel Vetter <daniel@ffwll.ch>, Tian Tao <tiantao6@hisilicon.com>
References: <1614735587-6621-1-git-send-email-tiantao6@hisilicon.com>
 <YEoW68A+Y1AehVPP@phenom.ffwll.local>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <297ec5e4-4729-5cf9-1697-2f2892d3bc40@redhat.com>
Date: Thu, 11 Mar 2021 14:13:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YEoW68A+Y1AehVPP@phenom.ffwll.local>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 3/11/21 2:11 PM, Daniel Vetter wrote:
> On Wed, Mar 03, 2021 at 09:39:46AM +0800, Tian Tao wrote:
>> updated to use drmm_vram_helper_init().
>>
>> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> 
> Hans, do you plan to pick this up?

The drm patch-workflow falls outside my daily kernel-work workflow,
so it is always a bit of a task-switch for me to switch to dealing
with the "dim" workflow. ATM I don't have any other drm work pending,
so I would appreciate it if someone else can pick this up.

The change does look good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

 

> -Daniel
> 
>> ---
>>  drivers/gpu/drm/vboxvideo/vbox_ttm.c | 7 ++-----
>>  1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vboxvideo/vbox_ttm.c b/drivers/gpu/drm/vboxvideo/vbox_ttm.c
>> index 0066a3c..fd8a53a 100644
>> --- a/drivers/gpu/drm/vboxvideo/vbox_ttm.c
>> +++ b/drivers/gpu/drm/vboxvideo/vbox_ttm.c
>> @@ -12,15 +12,13 @@
>>  
>>  int vbox_mm_init(struct vbox_private *vbox)
>>  {
>> -	struct drm_vram_mm *vmm;
>>  	int ret;
>>  	struct drm_device *dev = &vbox->ddev;
>>  	struct pci_dev *pdev = to_pci_dev(dev->dev);
>>  
>> -	vmm = drm_vram_helper_alloc_mm(dev, pci_resource_start(pdev, 0),
>> +	ret = drmm_vram_helper_init(dev, pci_resource_start(pdev, 0),
>>  				       vbox->available_vram_size);
>> -	if (IS_ERR(vmm)) {
>> -		ret = PTR_ERR(vmm);
>> +	if (ret) {
>>  		DRM_ERROR("Error initializing VRAM MM; %d\n", ret);
>>  		return ret;
>>  	}
>> @@ -33,5 +31,4 @@ int vbox_mm_init(struct vbox_private *vbox)
>>  void vbox_mm_fini(struct vbox_private *vbox)
>>  {
>>  	arch_phys_wc_del(vbox->fb_mtrr);
>> -	drm_vram_helper_release_mm(&vbox->ddev);
>>  }
>> -- 
>> 2.7.4
>>
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
