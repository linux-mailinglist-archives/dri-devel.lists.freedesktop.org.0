Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5735E6154BE
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 23:09:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8668F10E427;
	Tue,  1 Nov 2022 22:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FAEA10E427;
 Tue,  1 Nov 2022 22:09:28 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-13ba86b5ac0so18423091fac.1; 
 Tue, 01 Nov 2022 15:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IvStYSLqkWuMUwFL9pdUVrHNd8JNHDxjRFTnT52p7/c=;
 b=PjvZ7puHv+7V90LzJQPQaPyKXQrTIqJUZZLssvIWtIBipGVdOG7/MaPwIHfeqHkeRc
 KHfuwDz+A2r+ABa15478ookJDiRBnfALN+BuePEMc1Ex9su7/7WguQAoXAyKOoth/KbL
 APgp4aFD8yu67uTpxSeuKZ6enrP+NBtx2+bYLyhXMybpnESlwt+QGTlEU4I7hgCbigB7
 lCO+XBCRvgI+8VzchZ6ogM5qEv3tHKcWSVqccF9ZyFI0D3vxyZ2TfD0Lq4DxsCSV+srw
 r7CB4DXBoiAMa4GAGkpEFLsto+kdfO1YeZGuNZK7w6e7V5ImNz0A3M/L4PvxVwRN1ONF
 Hz5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IvStYSLqkWuMUwFL9pdUVrHNd8JNHDxjRFTnT52p7/c=;
 b=solWI3xOd3XFSMX4XV1KPwx5OkYvsaFjj4RY/5jBVzS7hS3TtMQrQ5CJ4kPKzfqcQF
 uEqrd8Ljxk/OqLP+eKR2Opn7QbhllW3jiM4tAq58g0NAcLJjCC41LH3k9/HQTepu94xV
 myDteE5HgNxclWnI7ZvEyWdS76yWqGFnA3Vi4SH2oJY1Q599EDrCknSodal5vR0XRT44
 RCN0OWcB208EdDkCDIXBBPoBl0psriVd+UStBf3f9gZt8Wf8/Mb90weyGvqsLBWge04m
 jFPm/CcEKhoPkwmqd9f8hbZ1iZBmjkSJ1Sy6qIrGXOumqj4p/iTYnmS0mUqwrTu6a+jc
 ikiA==
X-Gm-Message-State: ACrzQf0uKXVLBJ7ElV+n3bYRDJqUDkNd90WetIiJ/BP/fK201fqCPsXp
 naiC643tvtGx7fP395+LglqMY7EKbo3pay7ghIA=
X-Google-Smtp-Source: AMsMyM4lBZWMq6jgAvuEXIf45JlEUKQ3kVJp+Onr3xJO3280AGlJn/rv7oo3l1LLZxCdTzBoIr6dRE7i40Zdyylq7M0=
X-Received: by 2002:a05:6870:a7a4:b0:136:7c39:979e with SMTP id
 x36-20020a056870a7a400b001367c39979emr12655316oao.96.1667340567570; Tue, 01
 Nov 2022 15:09:27 -0700 (PDT)
MIME-Version: 1.0
References: <Y1trhRE3nK5iAY6q@mail.google.com>
 <Y1yetX1CHsr+fibp@mail.google.com>
 <CADnq5_Mod90O=tN26+Yi74WPYxpVtss+LG_+_HZyFv2EtzR+MA@mail.gmail.com>
 <202211011443.7BDB243D8D@keescook>
In-Reply-To: <202211011443.7BDB243D8D@keescook>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 1 Nov 2022 18:09:16 -0400
Message-ID: <CADnq5_Ou9HnZjQx5WaAZW+iu24g_eS2hh25xhExeQjdMOXYfCQ@mail.gmail.com>
Subject: Re: [PATCH v2] [next] drm/radeon: Replace one-element array with
 flexible-array member
To: Kees Cook <keescook@chromium.org>
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
Cc: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 1, 2022 at 5:54 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Tue, Nov 01, 2022 at 10:42:14AM -0400, Alex Deucher wrote:
> > On Fri, Oct 28, 2022 at 11:32 PM Paulo Miguel Almeida
> > <paulo.miguel.almeida.rodenas@gmail.com> wrote:
> > >
> > > One-element arrays are deprecated, and we are replacing them with
> > > flexible array members instead. So, replace one-element array with
> > > flexible-array member in struct _ATOM_FAKE_EDID_PATCH_RECORD and
> > > refactor the rest of the code accordingly.
> > >
> > > It's worth mentioning that doing a build before/after this patch results
> > > in no binary output differences.
> > >
> > > This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
> > > routines on memcpy() and help us make progress towards globally
> > > enabling -fstrict-flex-arrays=3 [1].
> >
> > This seems like a worthy goal, and I'm not opposed to the patch per
> > se, but it seems a bit at odds with what this header represents.
> > atombios.h represents the memory layout of the data stored in the ROM
> > on the GPU.  This changes the memory layout of that ROM.  We can work
>
> It doesn't though. Or maybe I'm misunderstanding what you mean.
>
> > around that in the driver code, but if someone were to take this
> > header to try and write some standalone tool or use it for something
> > else in the kernel, it would not reflect reality.
>
> Does the ROM always only have a single byte there? This seems unlikely
> given the member "ucFakeEDIDLength" (and the code below).

I'm not sure.  I'm mostly concerned about this:
                                        record +=
fake_edid_record->ucFakeEDIDLength ?

fake_edid_record->ucFakeEDIDLength + 2 :

sizeof(ATOM_FAKE_EDID_PATCH_RECORD);

Presumably the record should only exist if ucFakeEDIDLength is non 0,
but I don't know if there are some OEMs out there that just included
an empty record for some reason.  Maybe the code is wrong today and
there are some OEMs that include it and the array is already size 0.
In that case, Paulo's original patches are probably more correct.

Alex

>
> The problem on the kernel side is that the code just before the patch
> context in drivers/gpu/drm/amd/amdgpu/atombios_encoders.c will become
> a problem soon:
>
>         if (fake_edid_record->ucFakeEDIDLength) {
>                 struct edid *edid;
>                 int edid_size =
>                         max((int)EDID_LENGTH, (int)fake_edid_record->ucFakeEDIDLength);
>                 edid = kmalloc(edid_size, GFP_KERNEL);
>                 if (edid) {
>                         memcpy((u8 *)edid, (u8 *)&fake_edid_record->ucFakeEDIDString[0],
>                                fake_edid_record->ucFakeEDIDLength);
>
>                         if (drm_edid_is_valid(edid)) {
>         ...
>
> the memcpy() from "fake_edid_record->ucFakeEDIDString" will eventually
> start to WARN, since the size of that field will be seen as a single byte
> under -fstrict-flex-arrays. At this moment, no, there's neither source
> bounds checking nor -fstrict-flex-arrays, but we're trying to clean up
> everything we can find now so that we don't have to do this all again
> later. :)
>
> -Kees
>
> P.S. Also this could be shorter with fewer casts:
>
>                 struct edid *edid;
>                 u8 edid_size =
>                         max_t(u8, EDID_LENGTH, fake_edid_record->ucFakeEDIDLength);
>                 edid = kmemdup(fake_edid_record->ucFakeEDIDString, edid_size, GFP_KERNEL);
>                 if (edid) {
>                         if (drm_edid_is_valid(edid)) {
>                                 adev->mode_info.bios_hardcoded_edid = edid;
>         ...
>
> --
> Kees Cook
