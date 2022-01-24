Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDC949820F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 15:25:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B4F110E992;
	Mon, 24 Jan 2022 14:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A0F10EB91
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 14:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643034354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7lR4CEZmUA7KU2EEtClbGSv2hJzPsx0avoRxay7giE0=;
 b=TDDR+5FFmTPEA0WmZ6+iRsbBcYKyTlQqN8eJi8LEy0unw4D3MI24SHEJuzeSCSZgANulEy
 uOmKwQLkiZGYy3WQBqtEYGFgpCRFdaNu7cAYHVD+60/hJ7Sccy5bdf5vomgVfPK+Yw0z32
 jlKjyXo7bhH2TJ3na2df2gcOWCYiLss=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-n72zrqjePp-t-hZo-zPxKA-1; Mon, 24 Jan 2022 09:25:53 -0500
X-MC-Unique: n72zrqjePp-t-hZo-zPxKA-1
Received: by mail-wm1-f69.google.com with SMTP id
 l20-20020a05600c1d1400b0034c29cad547so15107764wms.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 06:25:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7lR4CEZmUA7KU2EEtClbGSv2hJzPsx0avoRxay7giE0=;
 b=NBY/ZF9IVcR7Py8UiYHNbulFYVrxuGhW8d2TFVcwHTGQUqgQ0JG/bf6ZXP6Mbtxn7Y
 4WJ7r7VMOjvvjk0CJ/IOtzsq1y8ESQyCQn6bxRIHV4pc1tvTNP3zv0hEyThTFByq7eGI
 brQ77H2b5bmTys04RHcmlFtk+3CGYgtu414PkfrrXICklIdbyT7w9VRhLczP61zl3LFu
 FUXNbTZGB04J89Bmzoo5/597o8DQ5IFFuZY66n8nakQB9o7eiyHeW7+nXHVz1s1BrL7E
 j2ZYryeW933fcJcCrXuuDtQgK0c8AgkW0XnUr57rFwWjb/1T5hGvUgN0dCq6CUL02gOB
 +8BA==
X-Gm-Message-State: AOAM5338iDdHsBrDMY5EALwIfeA97xk9V2hyOn4ib4RhkS87XaZT4Zuf
 VvhP36PM5eHKpu+tFAcqkttcgIrA7ofKEQ8pQ3Brtm7xF1PS8kCOPxCtFNrWQ1QSEsLHHF6Xokr
 9W81jxMLRDBt61kU94VQfJS8iMK1r
X-Received: by 2002:a05:600c:1d21:: with SMTP id
 l33mr2085592wms.134.1643034352142; 
 Mon, 24 Jan 2022 06:25:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIp5WYmpvxAnkgICIFMWJqVkRpKEZirVZ1OoWVlrqMrxGRvVgHs08iWCn81KmI17eLy1xm9Q==
X-Received: by 2002:a05:600c:1d21:: with SMTP id
 l33mr2085569wms.134.1643034351912; 
 Mon, 24 Jan 2022 06:25:51 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id u15sm1881620wrs.17.2022.01.24.06.25.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 06:25:51 -0800 (PST)
Message-ID: <811fa19c-5bce-4752-2fc9-720a6e34f484@redhat.com>
Date: Mon, 24 Jan 2022 15:25:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 5/5] drm: Add TODO item for requesting memory regions
To: Thomas Zimmermann <tzimmermann@suse.de>, zackr@vmware.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, hdegoede@redhat.com
References: <20220124123659.4692-1-tzimmermann@suse.de>
 <20220124123659.4692-6-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220124123659.4692-6-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/24/22 13:36, Thomas Zimmermann wrote:
> Add a TODO item about requesting  memory regions for each driver. The
> current DRM drivers don't do this consistently.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

