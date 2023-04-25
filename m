Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F776EE20C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 14:44:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A915310E723;
	Tue, 25 Apr 2023 12:44:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF7610E20B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 12:44:19 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-316d901b2ecso68615ab.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 05:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1682426658; x=1685018658;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=te/AU6YD3Nrp06W+/L24htOInvAS1q7FQ+X/iKWkuds=;
 b=K1ZWUUchq0Erw5U3Nvwwr6Mo6pQI0pLwySLG1iZlTS2NlkiPcqJL6ZJGTahZwp2eQL
 /fH5bojhLzWVrV5CCJg0gCzeyrpiaOiezhLx5FwHPvf5uARnYifDwuR2i54acxR2k9hg
 nfpIzgS+HrrFFAdD6nCGFJQXjJp9C//n46xY6fUNcuh8TXGFbjHw+O1v9F8NGO1xdXtw
 rrqR50Cf3+cRIVwbCVQtuAKHYwlfdtvhwG7yHD8loc3QydQOS3HSokGELGvZ5RO2ijuq
 lvKUiasZ9Iei9+KGhP9vcZaopFFCpvWhg3RuFBfr12ca4l6sfB7Mq+seYpX2lm48sA+d
 eAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682426658; x=1685018658;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=te/AU6YD3Nrp06W+/L24htOInvAS1q7FQ+X/iKWkuds=;
 b=fcAV+jZq+l4rRHBoZ7FUDYRZdeYYCCEICLm+1i0VQ6dRSmU4Kkx3pvBks0l7B9OPB9
 k8mVGKBdXmolVlEkra9fLxe4F0MdWO6CHsoVc1UBi7vavYBYYk5DrOoVmDzO8lQCGg9i
 r4hO4IwaT3Oww+beepmjyweXUxCn2N0cfU21qUVUFbySAP2AR0g1OvS6JhloQISoGlTd
 OF14MwVU4bmZ9Za1EmsZER+Vh7SzVod05VjceAdns0HsqXgXDCLHo/w8RH/Y38hmYIg3
 FYukXmAtiVT9T48OzYDJI0NdKMSIwBcU6XepRJpUeqYRieyDbhAo3RAC9T3gKvl/XLu+
 V1cQ==
X-Gm-Message-State: AC+VfDzWCEYEwxjVrSHBDvT6OnWZlUqQvN3o+9ISfOP6zu3M0YcVNv33
 ITcOeBD5g4M+fFd5jl2Nuc2pC00hpdmafDfWDnnu1w==
X-Google-Smtp-Source: ACHHUZ74AQK+Hh0UHK0Buv7tEFBp2Kr/Sz+rPOmb/ycOMlzaR8VN8UEyIksEFlfuHPAoisNNupP/MT4jPxfZHdEgMuk=
X-Received: by 2002:a05:6e02:1aaf:b0:313:93c8:e71f with SMTP id
 l15-20020a056e021aaf00b0031393c8e71fmr174663ilv.19.1682426657965; Tue, 25 Apr
 2023 05:44:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230224-track_gt-v8-0-4b6517e61be6@intel.com>
 <20230224-track_gt-v8-3-4b6517e61be6@intel.com>
In-Reply-To: <20230224-track_gt-v8-3-4b6517e61be6@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 25 Apr 2023 14:44:06 +0200
Message-ID: <CANn89iLE5fVEom+VgcOtc4DdceYDNj0ftfkd4NjjmTi1LpaDzQ@mail.gmail.com>
Subject: Re: [PATCH v8 3/7] lib/ref_tracker: add printing to memory buffer
To: Andrzej Hajda <andrzej.hajda@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, netdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 25, 2023 at 12:06=E2=80=AFAM Andrzej Hajda <andrzej.hajda@intel=
.com> wrote:
>
> Similar to stack_(depot|trace)_snprint the patch
> adds helper to printing stats to memory buffer.
> It will be helpful in case of debugfs.
>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Reviewed-by: Eric Dumazet <edumazet@google.com>
