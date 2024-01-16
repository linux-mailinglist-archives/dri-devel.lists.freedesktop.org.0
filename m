Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F7D82ED93
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 12:21:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D4C410E48A;
	Tue, 16 Jan 2024 11:20:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72BE10E48A
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 11:20:56 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-68163449a36so7458986d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 03:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1705403995; x=1706008795;
 darn=lists.freedesktop.org; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AS3BBwgYanBUfBnpxKNvwfAfy1OJUBRnEQmNzkGmJ1s=;
 b=eY3XmSxLgLd9TnNVIrxAR9JmU+sQe0pg46sXtJurgwL7gst0797jasEmfKAFlXRtRL
 cVKzH71DATVARvQgojU+LP3DfCRAkBsDZzwE9TvelVZql9rlSwPKwiMDFVV9/GLcgA75
 zgKb4ADmQq7ikpbtikYEYIJkkZdGkk/4UutYt3wC6m5sVnWWqwn7HclUQu33myicVidu
 vo4N7GVkDT8oVnDRp/8p7Drk/rhQV5ZYGbjGIVSWkweQfdKA2mZwdhRoCp5+N6jfG8ez
 2rrSXMQvesd/YwipEwyaSlPscXhir6HtnDywuhlIXcm2sj7eokDa6ft4InI5p2LNoLfo
 lY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705403995; x=1706008795;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AS3BBwgYanBUfBnpxKNvwfAfy1OJUBRnEQmNzkGmJ1s=;
 b=C02p+/H/9t2M+8zRVdg6zzR6pfg+Pw8aPo0vEBrQB4nNcYDGZgrYhkRilEkRnGKwRP
 gSR33qz3LW5l9YQLfxFAJqKt+PvmMux/uH/KccBiJBZ+hOCJWHqeY5gk5fxfGiaY4m06
 Ic+qJzP60x8gtX/bPzb+8gqgLPXkvYLBY1iWjuZzDG+qJJlU+FEsZxdjTkFpSaMMbOHb
 9UWmStavcaJDn0mOMLeoLtQiESbQDvf9uHYL/pMbK5NYQfy/Nw9hrEqq8uBJNjejviPF
 lje9LadrGvqhrKJsadboWhvRjcVEhHFQfVMsl/2c2qXXwuYPtSeyYPc0T0Tw7wUf+w5e
 PiDA==
X-Gm-Message-State: AOJu0YzVokJySBhfHZmw3JCL+bOnoP6WtIzxtafILibCAup9CnIFp12H
 1gfFXJEdEGqJzECDeHnPoWNJ4IvN3617IeZHWmz2riEC3DFvKcXXhhh6uj73MdQ=
X-Google-Smtp-Source: AGHT+IFrGX+QlGcwiMcvFXBVyO7eiX4wVISfsMNIemyKgmDmI8h7UYeLiWdxotNRUa1oCcK60IlwlDmzM+TIfP+BjPM=
X-Received: by 2002:a05:6214:31a1:b0:681:562a:16e1 with SMTP id
 lb33-20020a05621431a100b00681562a16e1mr4955020qvb.102.1705403995478; Tue, 16
 Jan 2024 03:19:55 -0800 (PST)
MIME-Version: 1.0
References: <20240116095439.107324-1-vignesh.raman@collabora.com>
 <20240116095439.107324-3-vignesh.raman@collabora.com>
In-Reply-To: <20240116095439.107324-3-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 16 Jan 2024 11:19:44 +0000
Message-ID: <CAPj87rNKLPETVGzpXaZtQwVGauH2V-fCuFGN4zrOE0nH2R+F+Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] drm/ci: mediatek: Rename exisitng job
To: dri-devel <dri-devel@lists.freedesktop.org>, 
 Helen Koike <helen.koike@collabora.com>, Dave Airlie <airlied@gmail.com>, 
 Sima Vetter <daniel@ffwll.ch>,
 David Heidelberg <david.heidelberg@collabora.com>, 
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
 linux-mediatek@lists.infradead.org, 
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 linux-amlogic@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vignesh,

On Tue, 16 Jan 2024 at 09:55, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> Rename the name of xfail files for mediatek (mt8173 and mt8183),
> to include information about the tested driver and update xfails
> accordingly. Since the correct driver name is passed from the job to
> test gpu and display driver, remove the check to set IGT_FORCE_DRIVER
> based on driver name.

I think something is still wrong here, because I can see that later
xfails updates are setting expectations on kms tests when we're
supposed to be using the panfrost driver. I can't tell which branch
was used to run this, but you definitely want to look closely at the
job logs and results to find out what's going on here.

Cheers,
Daniel
