Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEC92A59F8
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 23:20:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E446E911;
	Tue,  3 Nov 2020 22:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 404616E910
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 22:20:17 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id l28so24364909lfp.10
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Nov 2020 14:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QGOEhKsA2OwG13b5gtkFmoIkhKN0Tzb9Yz1d9AT63nE=;
 b=K1bjUKfX51b5qotZAiYNouvyUDtkH7cr0GZdA9qNvLxnxk0L95HdWtEl4yID/8o5ew
 T3cOoBhbIgYJiILZSN1Gkm6ujI/dJvD646mMVFkHQTe+FXEtf56MJl63OFZVE0HgAo+C
 THbItY64tC1LOig9tvos2ldGnH5k9hJgJyjTDn6okS2HvL5MnpeLV212jQcBuFLWpA7E
 vOBc9Ip7M5kKzR3yMVQ/AIGzLN0OYO96I5bqwTMcX3Rrt64kA2xf3/s70Hl8EPeZX4RW
 qKDjdLro3yz/JG3KXODfBo9EqPCkpwkWwZ1eAMjCDcrpY+J5h1ESvJjKNPMqEub0pwr8
 Ho9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QGOEhKsA2OwG13b5gtkFmoIkhKN0Tzb9Yz1d9AT63nE=;
 b=iWjDqn872rHVpUWUcy+/ArKDptK+Q2Q5fqobknrvtMbaP+VKzKLdHeRwaYIyNsI9Qt
 XRkawbMCiGkWCwr8FvdHijTrR1PpdIkt8JVPH2/nrg0z9Cq2bMGqAWaOuS2I4x5HbX+S
 ch822jYWQL14cwybDLi2DcRM7IwJamsAq6kdq0AhTr7jEBnjsjJyiYNAAOw7G2Yf29zv
 ooA+Ie/Z5EcAzuzCh6UkMiywipDswGEkIrvYXfMjPYqpK/+bnEzNLJSllpsAGhsxtg8w
 1MpLo4gnH4qDxQwILPMcver6kSZPpuW9r7cwazsJ4xr/KSPTe2vi2t6x3jF7CnXXEkG0
 S/Sw==
X-Gm-Message-State: AOAM533X1zz/i1AQHP6EmcakpG5QKvxIe3P769py5Cc8lF0vjtQg9fqc
 Ga05LUKt3yfYLMPbD7RN6kSGJw==
X-Google-Smtp-Source: ABdhPJxRFm8qsXfpAv3oTL3woMRlKjMmcXF45qhzM91T8QG4fQEQSZWh7OW4c9/IsFKaaVMgS6bfEg==
X-Received: by 2002:ac2:59d1:: with SMTP id x17mr8553159lfn.142.1604442015603; 
 Tue, 03 Nov 2020 14:20:15 -0800 (PST)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id q5sm3728627lfe.262.2020.11.03.14.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 14:20:15 -0800 (PST)
Received: by box.localdomain (Postfix, from userid 1000)
 id E18A7101FC2; Wed,  4 Nov 2020 01:20:13 +0300 (+03)
Date: Wed, 4 Nov 2020 01:20:13 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Dave Airlie <airlied@gmail.com>, Lyude Paul <lyude@redhat.com>
Subject: Re: [git pull] drm next pull for 5.10-rc1
Message-ID: <20201103222013.hypmzlq7uuqufe76@box>
References: <CAPM=9txyMmW1DWhS--SuYQu4qDK1GPzgHJwxbAfhHT=hUsPODA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPM=9txyMmW1DWhS--SuYQu4qDK1GPzgHJwxbAfhHT=hUsPODA@mail.gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 15, 2020 at 11:33:08AM +1000, Dave Airlie wrote:
>       drm/nouveau/kms: Search for encoders' connectors properly

This commit (09838c4efe9a) broke boot for me. These two hunks in
particular:

@ -2066,7 +2120,7 @@ nv50_disp_atomic_commit_tail(struct drm_atomic_state *state)
                          outp->clr.mask, outp->set.mask);

                if (outp->clr.mask) {
-                       help->disable(encoder);
+                       help->atomic_disable(encoder, state);
                        interlock[NV50_DISP_INTERLOCK_CORE] |= 1;
                        if (outp->flush_disable) {
                                nv50_disp_atomic_commit_wndw(state, interlock);
@@ -2105,7 +2159,7 @@ nv50_disp_atomic_commit_tail(struct drm_atomic_state *state)
                          outp->set.mask, outp->clr.mask);

                if (outp->set.mask) {
-                       help->enable(encoder);
+                       help->atomic_enable(encoder, state);
                        interlock[NV50_DISP_INTERLOCK_CORE] = 1;
                }


I hacked up patch to use help->disable/help->enable if atomic_ versions
are NULL. It worked.

In my setup I stepped onto nv50_msto_help->atomic_enable == NULL. But
there are two more drm_encoder_helper_funcs in dispnv50/disp.c that don't
have atomic_enable/disable set: nv50_dac_help, nv50_pior_help.

-- 
 Kirill A. Shutemov
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
