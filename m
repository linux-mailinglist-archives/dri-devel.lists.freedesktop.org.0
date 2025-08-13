Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1691FB23EB4
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 05:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E19910E195;
	Wed, 13 Aug 2025 03:01:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ivGvaABW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88CAB10E195
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 03:01:14 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id
 ada2fe7eead31-50e29b4fd2cso228570137.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 20:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1755054073; x=1755658873;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mwogx+eS89jOrYozXKAzAp0ij0rBCaM80NxlzPyEOCk=;
 b=ivGvaABWlHhf80wh/3AeziZwMkVerwcJ0d3mWcTlmyxwlmlVDs7582tkHRcSEcf9LG
 vnVGYVVUncEfM6lSHNpnF3feAZfDbgd/HcemZCEAAY4K4e9L/umDo+6kvOfFJf4C7OKW
 XnkRjWY8kq8WfEKi7xD+D3Qunj4wGspHLD6cQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755054073; x=1755658873;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mwogx+eS89jOrYozXKAzAp0ij0rBCaM80NxlzPyEOCk=;
 b=IKyB5Srap4lh5+5qe6I5FhoEJVtfefNgK4WD+f+A0DAWbw4LTH1VfsvVWtBRfsAxfW
 FSxTVM+FbfRGP6qCkQLq3vEB99fNXhyop2E3RF8Q8B3IE5wMfm9xGDOBZ+f5TuH7JYXb
 VCHxrE1uX+yW8ZklTZ3TBuG3eurlqcE75r0Tmp3SpoEjB1p+o3qkEAIJUto4QIPvH/8Z
 1oY6CbW5AjgQcg1jZnRDGFagW9PKqf0NsfQ1+PXjJ/4AMpfd2gwlHeOWmvjEj6NGqEA0
 SjemdosGBNj5QWmDx8hMDIRYHSl1VtwiKwl3uCzpzXn61MAhC9iYYKRPGIYspSGH8nPx
 SFZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFFRY07cu1+53XjKrqR0gHp5dxhduH6fQNXbathkE8X3uIjGUw88kA3g3b8yHDotAvk5koAcRcWFE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkIlIfajEDUoSId2SUXMR9fqWg1LkT90THe5ibXoNdX1Vpxfgb
 r2hSyTrjJ61VWQsswj2PjR86StmKTfVNHQ528sOb47pfgTm1atio8FVL07pckHCvg7IXJVF9Sl/
 GU/qoEA==
X-Gm-Gg: ASbGncsFLuKt9c11SnRNxFfxZuiexezJaRmUPKogHqQdSN0kjGy60kaA8Oz/bHBex+G
 DfWObMmq7bfEi+zzORePBJTZSHrhu8oWzqTseP6UzCRw3tKemKa+sXQABr4iisjdTnEAkDWtCcf
 oxFtPmWcKQ+VJtRax/5+dByTtKU/o8/T+Z9GPBnP8gNnk8kq9wozJOZFCaKgRHKA3nu/q8C7TX3
 Z7WBk+P3ZVn1RelcfIgAOvBX4Cod/jHC8lExutiWd52kvtktzxTM4HHvEx4NAyUp0elWLKB29q9
 mPBwA93ib67CyDQeVjcy7rRliIILFPyWgT+gOZjJUfLwo1ccPgRgJxlmV3DjCg+De5jxNe9hLhL
 p18rZ+IqANivX06iykRvgUVAx71+6vlqF2MUWAyKeE6w+19ojrSwSxWt5J18zN9o3IINa
X-Google-Smtp-Source: AGHT+IH6XZr+lCf01v+i3t9WRxTssJfawLTPA/PzSBJ9asU6Twv8ev14/ZGkbAotIzmR//5Z4eIMKQ==
X-Received: by 2002:a05:6102:54a2:b0:4e2:e5ec:fa09 with SMTP id
 ada2fe7eead31-50e783b5ee8mr292005137.6.1755054072913; 
 Tue, 12 Aug 2025 20:01:12 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com.
 [209.85.222.48]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-507dcae5200sm2042829137.0.2025.08.12.20.01.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 20:01:12 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id
 a1e0cc1a2514c-88db52e94feso360766241.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 20:01:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWizd+BpO1B5j1MUKbJuM9wYsHwW9kbsAPau3e7mcOSoGndZCgp46zlsVvfwKNHPOKA2ybll/NeKvU=@lists.freedesktop.org
X-Received: by 2002:a05:6102:14a8:b0:4e2:a235:24d1 with SMTP id
 ada2fe7eead31-50e782c12b7mr322781137.4.1755054071440; Tue, 12 Aug 2025
 20:01:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250812082135.3351172-1-fshao@chromium.org>
 <20250812082135.3351172-2-fshao@chromium.org>
 <CAD=FV=X_CiSoXyKkg8jBJLPKe3WDBpLEOAngQJNnN8yZfaC+qw@mail.gmail.com>
In-Reply-To: <CAD=FV=X_CiSoXyKkg8jBJLPKe3WDBpLEOAngQJNnN8yZfaC+qw@mail.gmail.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 13 Aug 2025 11:00:35 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhXO4mHkxGbLzja2au7RAfDR+-yRoGAkuMCKCc69N4rng@mail.gmail.com>
X-Gm-Features: Ac12FXyWFCZPXff1Dk6BrxbwFMsSYp_Qp3kx0qOfMjgPafXKsWbyukfoMR55OCE
Message-ID: <CAC=S1nhXO4mHkxGbLzja2au7RAfDR+-yRoGAkuMCKCc69N4rng@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] drm_bridge: register content protect property
To: Doug Anderson <dianders@chromium.org>
Cc: Hubert Mazur <hmazur@google.com>, Sean Paul <seanpaul@chromium.org>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Wed, Aug 13, 2025 at 2:07=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Tue, Aug 12, 2025 at 1:23=E2=80=AFAM Fei Shao <fshao@chromium.org> wro=
te:
> >
> > From: Hsin-Yi Wang <hsinyi@chromium.org>
> >
> > Some bridges can update HDCP status based on userspace requests if they
> > support HDCP.
> >
> > The HDCP property is created after connector initialization and before
> > registration, just like other connector properties.
> >
> > Add the content protection property to the connector if a bridge
> > supports HDCP.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > Signed-off-by: Fei Shao <fshao@chromium.org>
> > Reviewed-by: Sean Paul <seanpaul@chromium.org>
>
> nit: your Signed-off-by should always be moved to the bottom when
> posting patches. I wouldn't bother re-posting just for that, though...

Ah sorry, I didn't notice that..
Could you rearrange the tag order for me when applying these patches?

Thanks,
Fei
