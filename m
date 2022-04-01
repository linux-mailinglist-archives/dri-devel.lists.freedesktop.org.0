Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 324864EEC03
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 13:07:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08DFD10E033;
	Fri,  1 Apr 2022 11:07:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F3A10E00D
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 11:07:10 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id gb19so2135359pjb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Apr 2022 04:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+r6EP28f/Ptl0csP22+k8TOn+cpNh4f5hWwYK7TTSKA=;
 b=iijLDK3zC+TKzZaBhyuhlKBcwdXaxfcB6TImilqgECvS7TbqFpaUr7gZPzyLA73Xfc
 hJPE5bsFnstbGHX8K1YUd8WqfDwNfvs+pBtctDG0kc2OSgg+HFrEZ1VEaqWG5UXmLntP
 W6TQcSkBWmoQGXrPeFC21Qm69da3R9kje/85Gk5JLMKgpZooo+H3uLeGcMFP/Cj1184t
 kQv+9X4dU3I3CsgkvLdHFM4o+WtE0feJtzcGovDC7h0+iMg/xFq/qe+/XJ7430asSJXZ
 E+elxO2axZzi1nt91ER2meWfA6d6t31dNXRtKrUGnKYsB3rryeDs4eVbfgQwO5OnBdJg
 X12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+r6EP28f/Ptl0csP22+k8TOn+cpNh4f5hWwYK7TTSKA=;
 b=oLgh8kuDvue/RUp4ho2zdIQE7h9QXqg7EOAYkdqitWhS5b6qCwXDgh7zA+GsTyoB34
 c1LLxLIwC2Lvt1oBLDd0EH7OHGCP+UQwfJ+S3C1dsc/sqXPK+oYfzA/606YnHuKMKK6S
 ulnETiaS2IfcptoS6nzwE7tMUYLtcr4yjflL9EOSuxz/sMKq2ZDNf/OxVzK4hZRsSwnI
 M2a8Q/BxffF8TaVvmYGdp0xdFOLjoEqKo7m4QPCOm6dUzk7mnmgMJ65cVLpFBPIL7NYe
 TImWX7wPT7xZkSNwsG7wKaqzy11/V9g7ClC4KsMTIL2MsiZgNl38kp+FOftawIcIB0er
 JnvQ==
X-Gm-Message-State: AOAM531ti0jwnOQMDdphRq4/9dPF29gAWXVkuKxQAl//zgVTFrPJEDu4
 6Go0Mjw6U83+oDv02+UuqLg=
X-Google-Smtp-Source: ABdhPJyqGpeymcKcQPbQQ81k4IAWaUMQseP4GGRfubj2qw8Ovl4u1ketATNHziS7SSzYRO93zRIPbA==
X-Received: by 2002:a17:902:bf07:b0:14f:a3a7:97a0 with SMTP id
 bi7-20020a170902bf0700b0014fa3a797a0mr9999300plb.105.1648811230357; 
 Fri, 01 Apr 2022 04:07:10 -0700 (PDT)
Received: from ubuntu.huawei.com ([119.3.119.18])
 by smtp.googlemail.com with ESMTPSA id
 y12-20020a17090a784c00b001c6bdafc995sm13243426pjl.3.2022.04.01.04.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 04:07:09 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: patrik.r.jakobsson@gmail.com
Subject: Re: [PATCH 3/5] gma500: fix a missing break in psb_intel_crtc_mode_set
Date: Fri,  1 Apr 2022 19:07:03 +0800
Message-Id: <20220401110703.7951-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAMeQTsZnNy2ToRNTBisxVwBnj8Hsdz7+zdgcW=yr8C=zbAJZhA@mail.gmail.com>
References: <CAMeQTsZnNy2ToRNTBisxVwBnj8Hsdz7+zdgcW=yr8C=zbAJZhA@mail.gmail.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, yakui.zhao@intel.com, xiam0nd.tong@gmail.com,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> On Wed, Mar 30, 2022 at 2:03 PM Xiaomeng Tong <xiam0nd.tong@gmail.com> wrote:
> >
> > Instead of exiting the loop as expected when an entry is found, the
> > list_for_each_entry() continues until the traversal is complete. It
> > could result in multiple 'is_*' flags being set with true mistakely.
> >
> > To fix this, when found the entry, add a break after the switch
> > statement.
> >
> > Fixes: 89c78134cc54d (" gma500: Add Poulsbo support")
> > Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
> 
> This patch doesn't apply for me and needs to be rebased on top of
> drm-misc-next or drm-tip.
> 
> On Poulsbo there should only be one encoder per crtc so this is only a
> theoretical issue. But it is good practice to exit the loop early if
> we can so the patch still makes sense.
> 
> Also, please use the correct subject prefix: drm/gma500: instead of
> just gma500:.

I will resend another patch as you suggested, thank you.

--
Xiaomeng Tong
