Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C5B64DC3E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 14:27:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130C910E0B7;
	Thu, 15 Dec 2022 13:27:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB1E10E058;
 Thu, 15 Dec 2022 13:27:10 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id e205so5239175oif.11;
 Thu, 15 Dec 2022 05:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JsIQaBLZ4y5c4SSVGkwIGpgdreDIGpJl4ZYxNL20OAk=;
 b=GOsTQBHZJfSwCc7at+84Wne8VfHzLv+KhrFgkNn9pHjXjff4Rgb6TilqzYC8jSwxss
 iweGLomFjCzQMNuFR7SgsaFblTsV7TUu+D/EjVl+fkifbNe0J0R5DMaOuYZIXouZjF+I
 koF3xPPAEFKiWoxsQkAf/8N8ZTiIzLsimMlHDMp497CjLY8MXMQ4Reg6L+bUT4m0nUF/
 ocm2ksXC1fJs3SH8T/9/MAtkg0w/hvUJr+eklmLnKxIsWHAFEgE+vArlEeVqUvSvZX1Q
 eskt1U45Rez2uJe85ksPzc73FRCJFi4Rrwgxt4Beobh+FimXD/kiMc/n8c4zrYtWez6Q
 6Jew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JsIQaBLZ4y5c4SSVGkwIGpgdreDIGpJl4ZYxNL20OAk=;
 b=kjvdCGZZEat5meTJowkpZjJFzT5KWU/QkQHF2UrDPsiyTStGI2XDhNaRBEnr2iYyMM
 wD9PN+SNjJPxBKdfN9OlpC93+WCialnG7hwnkJB5FX2AdC8V6eXaEEOpgBtwy8JdAtC9
 xtz0slhGRDvoX/JF+a5VttKDRqAKFQDB0aS5NbEtGpWC+AeLBGfMgruM10lWYU7tY/kq
 /Dmu6w8V6ZXsaj0AXfjIpR9doVz+J3C94gs68qyD5GBKVbm51tXkNzE7GXFLVlVsop5l
 AT6ysDTWMInxSJXaWAw4I/1CSpOT/sfJKJhPx4d6GqroNPH878w8nr9ZlLzA0HQ6fGai
 X4TA==
X-Gm-Message-State: ANoB5pmmQ2dMjCyderA8QummpUG41edCn3QQWRTR2WPUt/cAL9TNPlj7
 c28v+v94EnOKlhMh7PcKNJLMxX7nyNgqkmzMiE4=
X-Google-Smtp-Source: AA0mqf5ANCMNl2eZjVgVSbuVvv1FF+szBstOQkYO+AUUyOEfa0KeI7RIkJUhYM1mhLy4Q2jd3etfyB7Ix1Xb0/7xIWI=
X-Received: by 2002:aca:b02:0:b0:35b:fe2a:a93b with SMTP id
 2-20020aca0b02000000b0035bfe2aa93bmr315587oil.60.1671110829956; Thu, 15 Dec
 2022 05:27:09 -0800 (PST)
MIME-Version: 1.0
References: <Yz8rIxV7bVCcfZb0@kroah.com>
 <20221007013708.1946061-1-zyytlz.wz@163.com>
 <CAPM=9ty0+ouf+rQWhM=9XSKFOA2zxKfa00MsNBvwrQGPQm2uPQ@mail.gmail.com>
 <CAJedcCwxioxr+4TBTdrEjAZh97J3oroSHSgax+bxSNRXCBvkRg@mail.gmail.com>
 <CAPM=9twhAL+c8mOLmidY_tEhEKwCh-CTjfs5yryOk8oGjMxuug@mail.gmail.com>
 <167110126066.5360.11413014428644610672@jlahtine-mobl.ger.corp.intel.com>
 <da557524-02ff-2ac7-7960-6f710c2d41d6@intel.com>
In-Reply-To: <da557524-02ff-2ac7-7960-6f710c2d41d6@intel.com>
From: Zheng Hacker <hackerzheng666@gmail.com>
Date: Thu, 15 Dec 2022 21:26:57 +0800
Message-ID: <CAJedcCxTMx1z2AWYdfzzsnDg_s22-o1enft44AmB9D+DHQsuvg@mail.gmail.com>
Subject: Re: [PATCH v3] drm/i915/gvt: fix double free bug in
 split_2MB_gtt_entry
To: "Wang, Zhi A" <zhi.a.wang@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "security@kernel.org" <security@kernel.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "alex000young@gmail.com" <alex000young@gmail.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "1002992920@qq.com" <1002992920@qq.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Zheng Wang <zyytlz.wz@163.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Zhi,

Thanks for your reply and suggestion about fix. I am a little bit busy now.
I will review the code as soon as possible. Also thanks
Joonas for the reminding. We'll try to think out the new fix.

Best regards,
Zheng Wang
