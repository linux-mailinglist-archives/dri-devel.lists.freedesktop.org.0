Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BA6533EEC
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 16:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30FE810E985;
	Wed, 25 May 2022 14:16:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97EF10EA17
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 14:16:11 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-30007f11f88so84564257b3.7
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 07:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=598sikrjYXNf9gR+bXjxuqcvriZ5gGSeCuJ05WXA9Eg=;
 b=njCb+jDlpLQHpdVWAHtRZ+6PLtnF+EvIvDeY4zRnj3fEBWZ1weE6T2dWnTfww+v8ch
 j+kiF1GzBY8J4EtAxnHfCdkFYjtfZT9lapZY4ExHd8OpMYFPhPxdyaHb7sP7tqBmA92B
 HOIeIaMUY23AzRVGbofc/MEJVc2WFxUu/mUff4zfMPCPrgJgi4F9zcjCaI4rkcqVVJlu
 n17/X44f+DheJlEkD3LZjlJFhmUP2UJkBU6V0ufRkqb9xKxQ/Gx7/DedpD4EkyXlkELr
 OqGarQtdrkheHRRwjzqaFqALT1vI5eb0Me5vsuAdBBYzV/BtE39TfxWA7/RHYtfPSmnu
 2OBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=598sikrjYXNf9gR+bXjxuqcvriZ5gGSeCuJ05WXA9Eg=;
 b=Iri+ZInxIrr5SelJ5C7WlvfreOXDVH09biqoBPxeny616lZrtW+llYCwlJUv0Di1Qj
 2VfGCI9KMTcX3j8qRoK4XClMrZD7aCLUSkc7xbD/TEZlLF1rdNohyiq0jKitHzFWFC31
 FX0sWOrYir3l1Mbn6Hj5jfe49YVFngXn1AAuidUBmPg0q0mnZN5HTadtp79Fz99zK4FS
 udhVEfV3LHuYQl/PDUz0vPIAjkMzdPfJWMH9wxD5u/W2mcRcX0tHeCvxvYhpkY9FNxg2
 C+PxWhzLPrgBxrDlrpHYK+OId6YlZUTvvd0fVUwudN894RqrzU9yqyVv6/97T9EH9Ake
 wQZA==
X-Gm-Message-State: AOAM532sKu4456qvWb3X4eeuAiZBdhHcHE2aLeTqItc71Bxed9LZGCs+
 e6TCW2QuI/AG5lBBkzGffT5PCGf9H2bwqAPAjg1IOg==
X-Google-Smtp-Source: ABdhPJxcajqaRuH443VA6TQFBYKMpaM1prIoqirimkYleEK88MLR05x6jQOk6gSrevQ8twERWeDdRawvtROXIYgDKOo=
X-Received: by 2002:a0d:d1c1:0:b0:2ff:cb6b:90cd with SMTP id
 t184-20020a0dd1c1000000b002ffcb6b90cdmr18218676ywd.385.1653488170926; Wed, 25
 May 2022 07:16:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220502163722.3957-1-christian.koenig@amd.com>
 <YnJQs1iusrBvpuMs@phenom.ffwll.local>
 <a01c7703-f7f7-f8ce-f80e-632a6fdcbbbe@gmail.com>
 <Ynkg81p6ADyZBa/L@phenom.ffwll.local>
 <a249c0c4-ee6c-bfb0-737b-eb6afae29602@amd.com>
 <Yo4pin1Js4KXs2HL@phenom.ffwll.local>
 <19808e9e-a5a6-c878-a2f7-5b33444f547d@mailbox.org>
 <Yo40X03axFXXN9/d@phenom.ffwll.local>
 <nR302DiNnOEkhrGg7TsRINiS2R-WuPiI2uJiERdMMaSUV9e_0xlX1eu1CzzhlCXJmJ-ss1BdkTSZ-XiEOnyMUTn6v3A_sb1jTkvAxfuS-f8=@emersion.fr>
In-Reply-To: <nR302DiNnOEkhrGg7TsRINiS2R-WuPiI2uJiERdMMaSUV9e_0xlX1eu1CzzhlCXJmJ-ss1BdkTSZ-XiEOnyMUTn6v3A_sb1jTkvAxfuS-f8=@emersion.fr>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 25 May 2022 15:15:59 +0100
Message-ID: <CAPj87rPW=YW8OnRyByJ_-6k3M9Oo7m7cTg88F8AF4TfudAjAJA@mail.gmail.com>
Subject: Re: Tackling the indefinite/user DMA fence problem
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
Cc: tvrtko.ursulin@linux.intel.com, daniels@collabora.com, tzimmermann@suse.de,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 gustavo@padovan.org, Felix.Kuehling@amd.com, dri-devel@lists.freedesktop.org,
 sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org,
 sergemetral@google.com, maad.aldabagh@amd.com, alexander.deucher@amd.com,
 skhawaja@google.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 jason@jlekstrand.net, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 25 May 2022 at 15:07, Simon Ser <contact@emersion.fr> wrote:
> On Wednesday, May 25th, 2022 at 15:51, Daniel Vetter <daniel@ffwll.ch> wrote:
> > > You can add that to the list of reasons why compositors need to stop
> > > using buffers with unsignaled fences. There's plenty of other reasons
> > > there already (the big one being that otherwise slow clients can slow
> > > down the compositor, even if the compositor uses a high priority context
> > > and the HW supports preemption).
> >
> >
> > Yeah that's tbh another reason why I think we shouldn't do umf as a
> > transparent thing - compositors need to get better anyway, so we might as
> > well take this as a chance to do this right.
>
> As a compositor dev, I agree -- we should definitely be smarter about
> this. Note, it would help a lot to have a good way to integrate the
> waits into a poll(2) event loop.

The same holds for Weston. We're currently working through a bunch of
internal infrastructure to be able to handle this. Mutter (aka GNOME)
is also really well-placed to be able to do this.

Having pollable waits would be really useful, but I don't think it's
essential. In my strawman I'm just waking up at the usual
just-before-repaint point and checking; if it doesn't make it for this
frame then we'll wait for the next frame. If someone submits buffers
which take 4 repaint periods to clear then we'll have 3 'unnecessary'
wakeups, but given the GPU is already slammed then it's not an
efficiency problem I don't think. (I don't know if all the other
compositor people share this view.)

Cheers,
Daniel
