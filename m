Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AE7164DAA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 19:30:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DD446EC69;
	Wed, 19 Feb 2020 18:30:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9163E6EC69
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 18:30:05 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id o187so427838vka.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CrYZW7UIEuLqwkPiXfCl3LLpSFAjnFsO2aYqjsMvIzM=;
 b=pWLn3TfUDMXWlEMQE2YYPb/ESEkGKVm4ZAdv4esqj5/8Q6rJpHwR/dTDZSIZIdSR4p
 OzxXKMhMR4d/qAXI0RL7cLMMUL7s3m4m67clcEdxNOdDkrs1Nu8CNPnk8kXBEf34c96L
 XFWSH3DUvDwAku0hG1S4YXzSUU3Fo9N63HmEyqb5FQ6xxeWRxTRmShmcilsxjBgvlcMu
 E4yIAu1Fp2UZPgdFI72LtWo4m6YcajtGIyBLliEm3jhIz07dQ1HDLzXis7B9wvvp58ya
 RNxsvMu6+rvmWrCgm9hYxg8v12LpdMx3TY6aCnrfZDL0ofuBgzuoMXIISP2po6Gh+lp9
 OYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CrYZW7UIEuLqwkPiXfCl3LLpSFAjnFsO2aYqjsMvIzM=;
 b=oC8vk7yd0uMzAIvG2OqVzoGzjjjTGz11A9NTLVDlBTQulmITJAwyZOtduf4nsj1T9C
 gSKLgRZIet26u88s+Q6yevjRJyFR8XBS2FvTRZB83ETL+BHfhn54RXmoJSeONY/Ac8RL
 EVF7STJuci4D1MnBHrJDFkhzcA5+orxr1yg/JJj6X8yGKuWhiD1iv3CJhg6fa0Zsvhxx
 /JSeuqygbXtnuSgxYxFf+Lc8PekhGlVLFjCnZ3f49eyiMcACvWQGDQ4XX3acGRdMQasd
 5+31errjB/5PH/E+fauRNfN31sQQqg/iGb0z0Fys2hYvOKBaIwMWTJoGCdQPj4YIWXUX
 9Axw==
X-Gm-Message-State: APjAAAX9Whyw31Aim/Six3rj03QU1MxIpaT2oym+vtK3xCscKlKIssni
 XDhv8Xt/JsGKpoxTPBFEP9zFZw3bMpg+NGNvm6+v3QGt
X-Google-Smtp-Source: APXvYqxFleSLMjfGgo5SuhzURsViXLDr/20NTLCOvlYLvempQPHm6gV5kxExsQLYuur/WPimicdBSuSbucPh3KWSfmI=
X-Received: by 2002:a1f:c982:: with SMTP id z124mr11665151vkf.6.1582137004768; 
 Wed, 19 Feb 2020 10:30:04 -0800 (PST)
MIME-Version: 1.0
References: <20200219175640.809-1-gurchetansingh@chromium.org>
 <20200219175640.809-5-gurchetansingh@chromium.org>
In-Reply-To: <20200219175640.809-5-gurchetansingh@chromium.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 19 Feb 2020 18:29:55 +0000
Message-ID: <CACvgo50D8r0GZigeKEqJmyZ4m+3ufKzw6toXPiqai4v3DbPQrQ@mail.gmail.com>
Subject: Re: [PATCH 5/5 v5] drm/virtio: add virtio_gpu_context_type
To: Gurchetan Singh <gurchetansingh@chromium.org>
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, jbates@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 Feb 2020 at 17:57, Gurchetan Singh
<gurchetansingh@chromium.org> wrote:
>
> We'll have to do something like this eventually, and this
> conveys we want a Virgl context by default.
>
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>

Reviewed-by: Emil Velikov <emil.velikov@collabora.com>

HTH
Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
