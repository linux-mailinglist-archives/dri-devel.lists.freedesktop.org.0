Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7559C6A201D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 17:56:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A5510E1E7;
	Fri, 24 Feb 2023 16:56:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ADAF10E1E7;
 Fri, 24 Feb 2023 16:56:13 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id nf5so13927837qvb.5;
 Fri, 24 Feb 2023 08:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=NUkUWtrXiLo4qYaXDaVs8ZvydqkJfRfk6fAOlcKEJsw=;
 b=ezFJGM1hHFN9qCKm9hFFfXns4wrecwjN4nbd6e7Iy7qqaKJk/Chdi+Rtb8j4H8jqND
 UNqUIuVVm2WoA8nbT55V3d6HcBsuqp9HWgRKsROcmKQF2mGlS5uep2a9df1gE9wwsz5a
 rJjHWzLD2x6Qx+4a+ABGhlIio5cwrVypG2m5FqtVRpbzI4nCWWq2BF/RpUgW3TGJRhHg
 qYESw/2Y97h8gxix8daD29qq0yCBrkBmlJSIU68P7M4XFe/Lcb7+SfFjSGZnWZX9t8lk
 Ai31sEFyGkZySC8pwwv5fi5evtjWgJwuzE2PA62biYYNUZYPFoZBbJCZDJi5VSjDPWa4
 V13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NUkUWtrXiLo4qYaXDaVs8ZvydqkJfRfk6fAOlcKEJsw=;
 b=Exdkhbf70/3Q5GXKy0uAyKRJVLWnIrkgwUrCwIOD5iKTdfIjGQQGTdNjju7HWAz2ND
 S3IKAEBgaVm3WJ0npjTsE6atqHGMX3HKM79ubrcFDDhHdeIeaunENQ3zT/ooXX7x82re
 K3gBi4YvpiTEG01kuDpqBPXB+TEjT6CrWmCIPh0kMpmduS3AMmWGZFVM5kR8CYx4p3F5
 2Vf1M+T8k48fnBWjBSYgcg6HGC32+S93TYzkb1qi12CEMZJqWpKvtubhlldt8KQv/ecp
 zaA3C9kK8uMscULh2s2jTNPIH7unOnvhFHMsm0FQIhwdWricOrPoOXTFWo8r764AOhUk
 GHSg==
X-Gm-Message-State: AO0yUKUauAatYnFkJ/ttWFf+ozeywgsQsOtFxUR+K4/msaU+keieNyy1
 GjWtznttVxVVBuka9DJ2QEPzhySNa4YI3ZH++oPNLRDN6U4=
X-Google-Smtp-Source: AK7set94EEqnta+h3dkGqwT3ndEx2n69ozij2dvRR5g/Cc7FrxNSN4SGrdqPR20UJ+49L/Q1ig8TeG2PvrfjbKhEoRw=
X-Received: by 2002:a05:6214:5e13:b0:56e:a4c0:cf64 with SMTP id
 li19-20020a0562145e1300b0056ea4c0cf64mr102406qvb.3.1677257772126; Fri, 24 Feb
 2023 08:56:12 -0800 (PST)
MIME-Version: 1.0
From: Chris Healy <cphealy@gmail.com>
Date: Fri, 24 Feb 2023 08:56:01 -0800
Message-ID: <CAFXsbZqnstOLFBrVVa7aFLSGCPNj4VkjExqq1XUoRdUUuBKdog@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/msm/adreno: Use OPP for every GPU generation
To: dmitry.baryshkov@linaro.org
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
Cc: sean@poorly.run, Marek Vasut <marex@denx.de>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>, quic_abhinavk@quicinc.com,
 konrad.dybcio@linaro.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I may be missing something, but looking at the code path for a2xx,
it's not clear to me how this would work with SoCs with a2xx that
don't support 200MHz for GPU frequency.  For example, the NXP i.MX51
requires the A205 GPU to run at 166MHz while the NXP i.MX53 requires
the A205 GPU to run at 200MHz.
