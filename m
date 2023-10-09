Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4AC7BEC32
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 23:02:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC2110E1AA;
	Mon,  9 Oct 2023 21:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A80A10E1AA
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 21:02:51 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-59f6492b415so43023067b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 14:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696885370; x=1697490170; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SJz0h0Tx8tbmQIBwQkViScvt69REAVK+f5XbSP6AYKE=;
 b=ihp5fZKtpFHGjdVW/ijaxgKcm41I56dy7i5ftE/uoruii4nuTIldXGpWuZMC2WSTyc
 Y9z/ePhbMeCltu0Lkeljy7Q21iNyeDa9GOwvDMbYj6O6S3ac3rHHOlvAzQMiYrAXdrSc
 NzqBE6/sY4Owu6Q7tKhcPYWV8FS2Ww9etPjnAKfeGyctCIkG1bKa5oo8A0HUxziXI4Xi
 snjDv+PQTIJRc4JJ7qm75IB9mMxIXlc2p/hE18noL7DoMG8O9qw7JJQBlerSHsgvaacN
 G9c9pR2rVJH/bg5hJHq1F+BLUX32sjgwKfS314WuF8l8Vgj+bNlYVzE8skT0fIABa1I2
 LExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696885370; x=1697490170;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SJz0h0Tx8tbmQIBwQkViScvt69REAVK+f5XbSP6AYKE=;
 b=FSAvzWvIzJ+wOTghYvrIg/IvE3vBPVoxvLejYrNVTBDwIJnpH7Ri8xrGswbyXT15wD
 7kSSq9+RKh+Ugmajjc9xQ/lrIXTkg2AAuR26JnB5+/BNwkP6lbK6a1c+pWX3SCZAvm1t
 yJsZKmIhnTlV/ukaj+bo46UgAKEbkn9J7dsXuPIzuIpBuiUdTP20B9XiKN/d8v/WkuR6
 e24Heb9Yq/ik7x+5BbRtq9Qr8uOv9li2a/5nEJ6rVcd/w976Jv+5sSQXsUjyzDTAZPX5
 CIYeg/regGhrWhgFVvM1B0xGQmZqys+8MyyXAnC1OuMp7iO9tOhsWgdHU3L1g4OijV7n
 OthQ==
X-Gm-Message-State: AOJu0Ywt9iWsHkmqRIK/dPiBUyLpOwa6J8eLgxnJyI09oV7Cl0nWiYaF
 n48k51+Ci1NT3FTakhpD9WNrIPwLHma22QB9IfOLJg==
X-Google-Smtp-Source: AGHT+IG7zTQ1sPIVq6sSufNIqZ5HokqJWtqPk7b7cMpFUs43lI/+XA7kKBK7iStn8zLZan3BdCgDzKJEQFuFjmdMKw0=
X-Received: by 2002:a81:49d0:0:b0:56c:f0c7:7d72 with SMTP id
 w199-20020a8149d0000000b0056cf0c77d72mr10143379ywa.4.1696885370504; Mon, 09
 Oct 2023 14:02:50 -0700 (PDT)
MIME-Version: 1.0
References: <20231007060639.725350-1-yangcong5@huaqin.corp-partner.google.com>
 <CACRpkdbek0-Vhk4_34qY+0=EGrQxJS_CfLuF_5fRozMMyc+=Kw@mail.gmail.com>
 <CAD=FV=UFa_AoJQvUT3BTiRs19WCA2xLVeQOU=+nYu_HaE0_c6Q@mail.gmail.com>
In-Reply-To: <CAD=FV=UFa_AoJQvUT3BTiRs19WCA2xLVeQOU=+nYu_HaE0_c6Q@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 9 Oct 2023 23:02:39 +0200
Message-ID: <CACRpkdYrFhTCa9rJ4savOcqRxcnyqoojCnwaCk6cnJv=aWxo4A@mail.gmail.com>
Subject: Re: [v1 0/2] Break out as separate driver from boe-tv101wum-nl6 panel
 driver
To: Doug Anderson <dianders@google.com>
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
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, hsinyi@google.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 9, 2023 at 10:53=E2=80=AFPM Doug Anderson <dianders@google.com>=
 wrote:

> Also: just as a heads up, Hsin-Yi measured the impact of removing the
> "command table" for init and replacing it with a whole pile of direct
> function calls. She found that it added over 100K to the driver (!!!).
> I believe it went from a 45K driver to a 152K driver. Something to
> keep in mind. ;-)

Sounds like Aarch64 code. I would love a comparison of the same
driver compiled to ARMv7t thumb code. Just for the academic
interest. Because I have heard about people running ARM32
kernels on Aarch64 hardware for this exact reason: so they can
have thumb, which is compact.

OK OK we definitely need command sequence tables in the core,
what we have now is each driver rolling its own which is looking bad.

Yours,
Linus Walleij
