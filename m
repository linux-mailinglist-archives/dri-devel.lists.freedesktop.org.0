Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F1CBFD9C9
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 19:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E3D10E818;
	Wed, 22 Oct 2025 17:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="g2aDiVog";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1DAE10E821
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 17:36:38 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b4736e043f9so1221528466b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 10:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1761154597; x=1761759397;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KDc9uPnFWHQPszDBfTgovarXp9ZLs359mjL10f9fGio=;
 b=g2aDiVogXv8v5XfS5pPBwu2lRznHSBAqjRD2IgQcTwtEi6lQZdjW44M/SLflAqPn5q
 Fn3IL3+zM6BdJ8phZrXoKOBUQbqd4lM1UdbuSYKZC4/pMacmOnFlZD0lQ34MQyht17Qh
 LkZBhUQjMQ/z+AjXRAtJuxWXLsRNPp7m1xxsfMTFByhlrLGNQG2kKlydJOcDf+PINkdB
 Ouy6CiMSUFkkC3GcPWQr9Dedc13UEHo0WIS8E9cZu5l7u0m5cY4hcS9VxzicsK2MPj7O
 EFbtDoPzPdB+r1KkALflOnDz6eosvIRIhCj277lmI3ecfQhSfHGs8+jKZJMMauN/VSvZ
 KCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761154597; x=1761759397;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KDc9uPnFWHQPszDBfTgovarXp9ZLs359mjL10f9fGio=;
 b=LKFvqQ3M/KlbvdS8zJOFJsbi3FHvmCr/qySzOr2vQ8lE6ha0H51eMDCjD9He0sT4lu
 7k9p6Db5s99cwuiZrmeu7ljhctKkesM63LL06ddnk70H/r35wABKRPZ9jy4TE07bFqV8
 f4QJQ3+DZrHZaqkH4pTJx8xHKmP21NnrcIfKn21TQxP+Z62ga5VsWb3W+2OKz9vdB2H7
 a7rqr915sAGGJCBU9BLf7b3hvN6m0h/F1JCmxoYSbppSKjMtDIuAtSEA8l3/QvxSnSWr
 fkpn6zs58IrHu4CjEXfjGvyC06k1M0Fyq8p+aygL3+xaj/Wp5+uGlrjLjhPvtnKRu/72
 KZHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYbuvGkNIJZX0sTGtSAnFon+luCRKfEv5E+gc3GzCi+bI5sJXoFVOzl+JJWQYOoXA6b0x/WSX31qE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztkLA/nAu/Qf6lkl0O7bsNnEMx9zW2Kxdh3bJV2b6B581otccf
 szWniIs0Ko1dYdjL+rM680W+UEhOTHBh4Z1CFPTVwZMtZ+/Lg286W65LzS6k/nSuAI/TecLEwFw
 eNuyhTR/OVQ+Oi0PVGP4VsBj4zF9jTkvZKncTXbk=
X-Gm-Gg: ASbGncsnMGE/FEByvnqMNDWJ9Y9l1JR1+jxZb/mORLdwEny19EeTNrw1rAXShnlitbv
 hpXK5FVuC9mIKN9MKRlDiOIRc8nC911gWUbIpcopcfdHaVwoRw4ZCP0Xb3PIWPJZD40e81w9VlU
 aTVE3GlDzkOsMmZjwMvKdjVpgS7bo+5nm0ePJKfsKNYou3kyK11b7X4dJ4z/nsj6pneDuCpflCY
 vZAuGv/JpSMfokr6QaLOaDeRcpvPbxNcVoINc1FEhiE3J77Q9Tfp9UIlFw97V+o+b5W9FDlpNWp
 tL5GErwpnVjhhpEAO11R+4a4
X-Google-Smtp-Source: AGHT+IHRIKvSw3QZyyMuq3QEZYW4E6PeOxMLoRxS4Z20xDGy+IgP6M7w9dWSdCVm1bLEYiapH6PTfAxhxGWjK774Ohc=
X-Received: by 2002:a17:907:720b:b0:b54:981c:405c with SMTP id
 a640c23a62f3a-b647482e031mr2321145466b.65.1761154596837; Wed, 22 Oct 2025
 10:36:36 -0700 (PDT)
MIME-Version: 1.0
References: <20251022114438.1096382-1-madhurkumar004@gmail.com>
In-Reply-To: <20251022114438.1096382-1-madhurkumar004@gmail.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 22 Oct 2025 10:36:23 -0700
X-Gm-Features: AS18NWBuOs6ve0VWpktYwGR0S4Z3DxPaoZbD_xAQcyerWbGB8XP823s39evNbcI
Message-ID: <CANDhNCp4+QPhBkWgFkM-3QkFCdb80RCB=fa_7DUDO1N53F_1ZQ@mail.gmail.com>
Subject: Re: [PATCH] drm/hisilicon: kirin: Convert to drmm_mode_config_init()
 and drop manual cleanup
To: Madhur Kumar <madhurkumar004@gmail.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 kong.kongxinwei@hisilicon.com, sumit.semwal@linaro.org, 
 yongqin.liu@linaro.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Oct 22, 2025 at 4:44=E2=80=AFAM Madhur Kumar <madhurkumar004@gmail.=
com> wrote:
>
> switch mode_config initialization to drmm_mode_config_init() so that the
> lifetime is tied to drm_device. Remove explicit drm_mode_config_cleanup()
> from error and cleanup path since cleanup is now managed by DRM.
>
> Signed-off-by: Madhur Kumar <madhurkumar004@gmail.com>

I think YongQin may be the only one who can still test it, but no
objection from me.

Acked-by: John Stultz <jstultz@google.com>

thanks
-john
