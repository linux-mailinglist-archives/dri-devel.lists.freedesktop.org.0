Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D201626D860
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 12:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D156E0DC;
	Thu, 17 Sep 2020 10:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8EB6E0DC
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 10:06:37 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id c8so1911754edv.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 03:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=tlftyNhO+40Lhb54vmacIoJABhF/FtVOEglwoOSH5+Q=;
 b=sUpC/gFUZWtWeuYm0TxKaKwVFxJ+PKmxCyM3HWAPHjAag41alOwFksV7r4OXsnSgk/
 WhCJD3ZUIJWBIAHFoyB4KKNVVZr4PMA/No4l78R3DAG4vex6i8myfOHViYoCJxHaS84g
 7RMigeyzy0Xw/TO8OpWlx3PPB3vMSvHUIlbZxyArh6FX0qw2mAL4CkFPIX949l4++yJT
 xblKb+7RoW5e7vQn84PuR4z0F+y/1rhHPk0Zh9Z+fJt4I+2QP+uq/wu8973EiSVMX34O
 TfmeizOshiYtjUK/T/dNI707ANII6uSZkOeJ3+v8cMO7uOLRP4lA10Hjy4Fq8DDdU9Ys
 57WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:to:from:subject:message-id:date
 :user-agent:mime-version:content-transfer-encoding:content-language;
 bh=tlftyNhO+40Lhb54vmacIoJABhF/FtVOEglwoOSH5+Q=;
 b=cwS9wpF/+cL/gbV3GNggzuStBSftjmEVq4b1Az9R0v8qc9wQ0ZdLNFcw8w4Ke03UYQ
 U/h4x/JpGk5KsQCYWNSJjIU0eJD+GQA9vnBZkjGx+MFZr4B4wwGCE4s9U5D/9qibMgM/
 XC5J5+c4kw9akkDE8rzs3rFCvt5EEzN/uxQDxpUBNXXiP0odd2LRCD1T96ai9BaPgdkp
 hSd85hX3SG+L8b8tgB91EvWY8Z6n+ZycINjq6QChzRLum1csUQaMv7ZYqDFgFcQqR1dv
 0mgMU8JLm+yMC5mBOSLAnm8wHpIIIlDA9ghQDcuU5sYGaHFsyDLGt63ytdX3uaWYeenP
 fJNg==
X-Gm-Message-State: AOAM533aizXyRgSfQZwm3bmvi2O7FegypriKbXAJypcJqIjGUMu9u7KK
 LHu73GmQpZgRdzg6/UqS9o/wqLqr49g=
X-Google-Smtp-Source: ABdhPJzcJ9IxNdFGzjncLCnGr9WcpqGn4O2a1vFRZuum7SzgOJKpIbYbC4QnbTPGvHjAy5AWWU5V3g==
X-Received: by 2002:aa7:dcd2:: with SMTP id w18mr32670601edu.288.1600337196081; 
 Thu, 17 Sep 2020 03:06:36 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id m6sm14683843ejb.85.2020.09.17.03.06.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Sep 2020 03:06:35 -0700 (PDT)
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Why is nouveau using a separate swap storage?
Message-ID: <5315ceb2-8be0-5a12-5d9d-9244ebf17e74@gmail.com>
Date: Thu, 17 Sep 2020 12:06:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

just another TTM feature which is only used by nouveau.

We have this bo->bo.persistent_swap_storage pointer which is only set by 
nouveau to the GEM filp and used when a BO is swapped to a shmem file.

As far as I can see this doesn't make any sense at all? What is the 
background here.

Thanks,
Christian.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
