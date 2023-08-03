Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C980976F4B8
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 23:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B0610E229;
	Thu,  3 Aug 2023 21:45:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8184B10E229;
 Thu,  3 Aug 2023 21:45:04 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-99bcfe28909so190316966b.3; 
 Thu, 03 Aug 2023 14:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691099103; x=1691703903;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HaYuvNho82/3JoIW9uMM5DA1w2BZFEEN1dpOn4dOCYA=;
 b=LEQB97gs15C5drjFPsRX6pNFUhJGKZn6eMeQrdeX6RjGV90W75skz29QmAIUZSpjnF
 DckI8rCCgo/OckbHuFmUUpTchAcesH1E7h7qwLhmb3jPDimwShZ/3NE6bgfeiylM1vFU
 QwxvjHZ/IrVcxv5yHZdsaaiQGdvyiF3F+lbX1cq9WZ9k6CxolLqPM3K6sCPrRgJqvnQF
 KcLZoZ6wHPTqFQhhDsSi8Ttynylva+zEdRH9ddjaXRJA0Ve7LilnOthVF2oF7o24u7XI
 MojGiZYOzIc5po41zrXFtG4AYp3ey6tlZKR16r2YGNg1G/SdiOL+XHfXYVXzJYumXSK+
 +y4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691099103; x=1691703903;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HaYuvNho82/3JoIW9uMM5DA1w2BZFEEN1dpOn4dOCYA=;
 b=WKZvZznUFodqvCqI66PQiA3bFycwTNHyXidCprNg/cEuh4e72P4RjOtPo/SDbkqDMG
 GPwOd+VvBk5EopNmXw7R3FKY9anL0LNxXVHRV1t1oqrr+x/LB9WEpUQYzivsH5IBO4Hk
 ylwawEphz9NimP6mzYj+HoYgC6N62BRONbFfqb77rkpbCeUD4ejFhSTH2KSV9vY7R84l
 mnooYgtR1pRDD679tfrb9ZczPNgTy3dRGLKHtfCNIVmnc+MgXLTuVCSgaD/XAMjGOPPy
 zR3WyNKnfyyveDARZ3+J6o9CjovYZJH9gw6clVTm20SSuWzfW0P0rz6nJ+a0fq/r8Kq7
 5rMQ==
X-Gm-Message-State: ABy/qLbfC5vzjoiB4IR6rHOmBQ1CP0gMYNVWGXYwdgFS0CEIRuIX39B4
 xxPA2ZuyOMi976ETS6BM0l85MMpakbCbKJn75AkUOEbpPIQ=
X-Google-Smtp-Source: APBJJlHLoJ0PkDsLRAMOkZtbDvcgvvv90dTf90+lzyvmgHkOa6lr/3F5tgLbEzninHt+i8hbZRMAwZ9c1jrVaieJPAs=
X-Received: by 2002:a17:907:760d:b0:99b:f3d1:7735 with SMTP id
 jx13-20020a170907760d00b0099bf3d17735mr7746784ejc.29.1691099102603; Thu, 03
 Aug 2023 14:45:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230803165238.8798-1-dakr@redhat.com>
In-Reply-To: <20230803165238.8798-1-dakr@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 4 Aug 2023 07:44:50 +1000
Message-ID: <CAPM=9tyAD=ZGvgdNDrNpa7BOUnUv7T+6MuTbbtL4jy_ZzXRGkw@mail.gmail.com>
Subject: Re: [PATCH drm-misc-next v9 00/11] Nouveau VM_BIND UAPI & DRM GPUVA
 Manager (merged)
To: Danilo Krummrich <dakr@redhat.com>
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
Cc: matthew.brost@intel.com, willy@infradead.org,
 dri-devel@lists.freedesktop.org, corbet@lwn.net, nouveau@lists.freedesktop.org,
 ogabbay@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, boris.brezillon@collabora.com, bskeggs@redhat.com,
 tzimmermann@suse.de, Liam.Howlett@oracle.com, bagasdotme@gmail.com,
 christian.koenig@amd.com, jason@jlekstrand.net, donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 4 Aug 2023 at 02:52, Danilo Krummrich <dakr@redhat.com> wrote:
>
> This patch series provides a new UAPI for the Nouveau driver in order to
> support Vulkan features, such as sparse bindings and sparse residency.
>

Now that Faith has reviewed the uAPI and userspace work, I think we
should try and steer this in.

I think the only thing I see is the SPDX + MIT header in some places,
I think we can drop the MIT bits where SPDX is there, and leave
copyright and authorship (if you like), personally I've been leaving
authorship up to git, as it saves trouble with people randomly
emailing you about things you wrote 10 years ago.

Otherwise for the series:
Reviewed-by: Dave Airlie <airlied@redhat.com>

Dave.
