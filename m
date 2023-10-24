Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B92887D4E7D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 13:02:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5580F10E342;
	Tue, 24 Oct 2023 11:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA8F10E343
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 11:02:26 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-991c786369cso641504466b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 04:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1698145344; x=1698750144;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SRT4cSVhNDt/gt1+W8wGnFtj5cZ9LMwEvbWkkUveHDU=;
 b=Dt+KVaqzb1IR3c/9/0ts21kgbZF2rxd3kvo+Bmj1WviExnNnYfL7qVbsEs52AyI7pH
 QJJNXBvwxmkV8+DaVMrjphJrwWR026Uw0qijd1dmqnJxT+JXB4uxiq4AKx5ktJZRbnVY
 BTw1NlMXUFHVkn/edgZghSNrFXpUgdve0oCyrw2vuqO3Lo3d2uKOLTISEiG0/znpFA61
 6fKCyRJwHQMkxYWfRXOkuu2891PAZH9K3UOS8VHBclIRODPLFSEVllxKRcRX3RCCBiZL
 p0mrzVZjE1yqc+qq2KxeycONDxKoJL7+UCqm3TJmZUmbi4wdowdnty2tXYKU2mb+PKar
 NA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698145344; x=1698750144;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SRT4cSVhNDt/gt1+W8wGnFtj5cZ9LMwEvbWkkUveHDU=;
 b=Wa5Emju1KMdE+C5WOYaWJg740f2dPqsMo3drgwZQ8rPr+p/8KX68rXPrVOeoxLueAx
 ZwKAGn4bY4SmD7J0/+r63AZfKgWRh3wHjoNvgIkyOt/UGRCpmTa2QUFWrz/bGGmeZSWj
 n5IYdaqr0WlJGy7Gxofd4/11ouMu3/NyT1MLhzzu9/Ehblm56843O9rn5cjkfMwA2ni4
 nMydnedCf1kvcYc5w4OxxlOgOH5PVIcRhHg1CveqGkZ3eDCvYJAYSGZy1Tqv67BED+Y3
 JftVgRAhMy6pMP5k8XhJlh9vIjpOLWFbCIfrb68GWdg6lADsaJrJNTyoXopTRFdkwKsc
 rc/w==
X-Gm-Message-State: AOJu0YznvGVwQkYyDOT2NULkD3f5D+M0sd7Gn0bA/HhlJnWxVDIDg1qc
 EH2/sUvgyJ+vFcsxZb7phq9vm20NR/AebYKIzrJuP8Uch8WayWuy7sk=
X-Google-Smtp-Source: AGHT+IFbPOBf3K0Y6H9ybRs/7U6OXAAroC9UfhA67NW842mvnrIozCN5xcsC/1LyQedeH5rjJuJ5+2a02qlG4k46llQ=
X-Received: by 2002:a17:907:94ce:b0:9bd:931e:30d8 with SMTP id
 dn14-20020a17090794ce00b009bd931e30d8mr9138402ejc.14.1698145344519; Tue, 24
 Oct 2023 04:02:24 -0700 (PDT)
MIME-Version: 1.0
References: <20231020101926.145327-1-contact@emersion.fr>
 <20231020101926.145327-2-contact@emersion.fr>
In-Reply-To: <20231020101926.145327-2-contact@emersion.fr>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 24 Oct 2023 12:02:12 +0100
Message-ID: <CAPj87rPTfCe8qqPD_b74LXkOvkP5w-41+KRDT8f0L44YuLmerA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm: introduce CLOSEFB IOCTL
To: Simon Ser <contact@emersion.fr>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Daniel Stone <daniels@collabora.com>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Sean Paul <seanpaul@chromium.org>,
 Dennis Filder <d.filder@web.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 20 Oct 2023 at 11:19, Simon Ser <contact@emersion.fr> wrote:
> This new IOCTL allows callers to close a framebuffer without
> disabling planes or CRTCs. This takes inspiration from Rob Clark's
> unref_fb IOCTL [1] and DRM_MODE_FB_PERSIST [2].
>
> User-space patch for wlroots available at [3]. IGT test available
> at [4].

Series is:
Reviewed-by: Daniel Stone <daniels@collabora.com>
