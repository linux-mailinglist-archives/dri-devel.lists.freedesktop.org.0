Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D934127BD
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 23:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E846B6E85E;
	Mon, 20 Sep 2021 21:06:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1DC06E85E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 21:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632171971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QYU+FG0NgEDN5QbX73oIIwX0hoDQqIX9Lmp+LI9M8t8=;
 b=IVX8sqH0GkBdoygwqFlodSyNhOWnP5fNDyerDk+Af4qxE+nDFFDS2ntCIGXCY+kaRPmovT
 Ad1yMCkvyRdXzLZYccZY8FxGlA7LyrYyRrEFwjBMSbtogLxBM9mfSGd9NDVFoc9r3My1kh
 BvXdIAZlHf8KCnb2hbt/fWu46IylNKg=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-zl7paaCoOmK4Kl1NKQz3ag-1; Mon, 20 Sep 2021 17:06:10 -0400
X-MC-Unique: zl7paaCoOmK4Kl1NKQz3ag-1
Received: by mail-qv1-f71.google.com with SMTP id
 b8-20020a0562141148b02902f1474ce8b7so200115743qvt.20
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 14:06:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=QYU+FG0NgEDN5QbX73oIIwX0hoDQqIX9Lmp+LI9M8t8=;
 b=jKTt2Gdz9Sh/MV+yXlwwIDe4HHwB0V3/bh5r8gBFhbOT69pD/E3NY4nxdAhD7WE3us
 PmEFT5Wgh67cI0xXUWLCqmVG3WFrMwfLZFL1PRLGq2pf1exRBzefnxSh012bCUITqvQ1
 7djc1oWEw+yHbDGahFqFzaKqkFPl51Pl5I3vrg2jzi3UMI8DYiIdXvV5uI0+Hs+EO8QP
 IqThOdJbqCBRGSPEsB+/v4XnnuTaW9m5SolprPJGymN1xUflLRhN5Uo9blhCzK4AavHH
 G8MlWKFRLVINv4vrDwbJfE3LHyJbD3gHSR71p6wWPZOVVU/JWWvfOcPJVbnbOBVXocJr
 2ELQ==
X-Gm-Message-State: AOAM530W/FDp8vu2Ibxn+xF9BLj8nasgVKW8p3/dOYGl9ALXEpUs4dV5
 7ioTJB8zl52KZBMV9o6uCYfmycmle5vm5CbTGBz7ZNvZtiOe+43sVwTgzVZwtE7+W0qzE6G48rQ
 hVwdj57QlHs6m9OoH8yJheOxS2Ova
X-Received: by 2002:ad4:44f3:: with SMTP id p19mr27905082qvt.33.1632171969999; 
 Mon, 20 Sep 2021 14:06:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyS2jHSKoCWXuvuoiupSPbp5jSZ8WpAjMlaKmSvPqiXflQvfBQ1tFrLdqMk5bP0vfLGV3tG7A==
X-Received: by 2002:ad4:44f3:: with SMTP id p19mr27905058qvt.33.1632171969792; 
 Mon, 20 Sep 2021 14:06:09 -0700 (PDT)
Received: from [192.168.8.206] (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id x4sm7820134qkx.62.2021.09.20.14.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 14:06:09 -0700 (PDT)
Message-ID: <38aa092530b936609ba2b425e5caf2d63dbcf617.camel@redhat.com>
Subject: Re: [PATCH 9/9] drm/i915: Add privacy-screen support
From: Lyude Paul <lyude@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rajat Jain <rajatja@google.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>,  Mark Gross <mgross@linux.intel.com>, Andy
 Shevchenko <andy@infradead.org>, Ville =?ISO-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Pekka
 Paalanen <pekka.paalanen@collabora.com>, Mario Limonciello
 <mario.limonciello@outlook.com>, Mark Pearson <markpearson@lenovo.com>,
 Sebastien Bacher <seb128@ubuntu.com>, Marco Trevisan
 <marco.trevisan@canonical.com>, Emil Velikov <emil.l.velikov@gmail.com>, 
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org,  platform-driver-x86@vger.kernel.org
Date: Mon, 20 Sep 2021 17:06:07 -0400
In-Reply-To: <a4f10bbe-c87a-90f1-0691-01c0da485fa6@redhat.com>
References: <20210906073519.4615-1-hdegoede@redhat.com>
 <20210906073519.4615-10-hdegoede@redhat.com> <87sfy4x3ic.fsf@intel.com>
 <a4f10bbe-c87a-90f1-0691-01c0da485fa6@redhat.com>
Organization: Red Hat
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 2021-09-16 at 12:32 +0200, Hans de Goede wrote:
> 
> I'm fine with refactoring this a bit and adding
> an intel_modeset_probe_defer() helper for this, I assume I should also
> move the vga_switcheroo_client_probe_defer(pdev) check there?
> 
> As you suggested yourself in your reply to the coverletter I will
> push out the rest of the series to drm-misc-next while we figure this
> out. Assuming Lyude is happy with the answers which I gave to her
> remarks about some of the other patches.

I am, btw!

> 
> Regards,
> 
> Hans
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

