Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFDB4A401B
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 11:27:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED8F410E6AA;
	Mon, 31 Jan 2022 10:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970E910E5AC;
 Mon, 31 Jan 2022 10:27:19 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id i19so12330025qvx.12;
 Mon, 31 Jan 2022 02:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=efJykIpqBlBe+SEilN08SLbSLBpDW0/pvbbIzOgjxIo=;
 b=JUCIsrem9h9ntq//JaQ872vkFAh2lupNbZOVU1dbah/XwZqfS8UtIADoRJP58YUTop
 KlICSYUSb26/3gRneCm7KcQ/ZcVI/gvLupmK/s9SgIiYCseEgsBROz6xwNdUP4/pCVma
 vETKL/i8tYISPpzWoRUIADw5pCM481YZgaFg00Evkh/qA3ctNhzEboeQ3KDri+rRKd65
 OOZXCQBFl3riZA92vxpY2Y21EFuzWHcoORf49ysz1KNXt2Q/4OonDyjlK+KYwLQprYYJ
 4XImEZhIQSUM/jvDSQ2ZX4DWJpwErZhx2T74nryyfwucR8ol62nfSVatjvpFxRFvck1N
 Ad3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=efJykIpqBlBe+SEilN08SLbSLBpDW0/pvbbIzOgjxIo=;
 b=23X73iyXhC8WobbTuHjDJ63kfd0HxEPCiJe9ErvQxR7DqqQ+z6cqipGzZycKLAZTUF
 HeiKQGukt8hJIjpLwRJBxC2RWJvAsoHgZHTBOZf+HEhjSwgb3vEFbLnrd9i9ugl0OniQ
 pmvwcy2xO2KVe8W4y9QC6BIWplrggOKFcZoEZaf/kuwwgByF25qNeIV59XLmcHIb5TCc
 iOBZUEk+PeIXjR4xH6Lsb20guK6apl3+rn1sicyAVq7DjvkxeGdtVSFtIEzlJq5Fd7aE
 bBIpa9W8h2VuGQtIDR01OYI3HXcb4Xbjss6KJDdH7mrh62WYBezKRV3AmGSA5Zb0y+HY
 H1yg==
X-Gm-Message-State: AOAM531e1xoomBlMQlDVdDWVoFhUUWo6ej1CIiYns7mmiiolzp/dwt22
 NLPTIJv/b01NI+86Aa8IGI7M2OXlCDcZ3FS37Kk=
X-Google-Smtp-Source: ABdhPJw39xiooDkX7gsx5qmLQ6N8YbksDooGSCo2e/fITzCPq8CXdstDNqY3nWjV4hTlvcnE/s/m5lz1KyXI7jPn0ko=
X-Received: by 2002:a05:6214:2344:: with SMTP id
 hu4mr3150222qvb.0.1643624838729; 
 Mon, 31 Jan 2022 02:27:18 -0800 (PST)
MIME-Version: 1.0
References: <20220128185209.18077-1-ramalingam.c@intel.com>
 <20220128185209.18077-3-ramalingam.c@intel.com>
 <32da9b50-536e-b999-6eb5-9d658979056b@intel.com>
In-Reply-To: <32da9b50-536e-b999-6eb5-9d658979056b@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 31 Jan 2022 10:26:52 +0000
Message-ID: <CAM0jSHNt5gicCyNeU7cfgT9_Hm+SQgdSXpT2QuPH3c-d9Xv58Q@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 2/5] drm/i915: align the plane_vma to
 min_page_size of stolen mem
To: Matthew Auld <matthew.auld@intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Chris P Wilson <chris.p.wilson@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 31 Jan 2022 at 10:18, Matthew Auld <matthew.auld@intel.com> wrote:
>
> On 28/01/2022 18:52, Ramalingam C wrote:
> > Align the plane vma size to the stolem memory regions' min_page_size.
> >
> > Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> > cc: Matthew Auld <matthew.auld@intel.com>
> > cc: Chris P Wilson <chris.p.wilson@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Do you know for sure that the initial fb is allocated in stolen-lmem on DG2 btw?
