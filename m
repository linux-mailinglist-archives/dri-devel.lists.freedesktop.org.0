Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB1CC53754
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 17:40:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1000210E0E5;
	Wed, 12 Nov 2025 16:40:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i6H/ZNUN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F183210E781
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 16:40:33 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 46e09a7af769-7c28ff7a42eso258423a34.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 08:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762965633; x=1763570433; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ka+oo3pgj2JB2kc973RtV4omtwTlaZBtkFnKjkUoQSA=;
 b=i6H/ZNUNsr20YgUSoyBFNd89HxqvTKPHpXFia+LBufWtqgMrCArTmD7Kzl0krByzBa
 M79dIsBktFSWff+ymVnz9v0FXwJQ6x3lneGhE6wial709iXFXxsKJCtO9L6b3YqJ6Uss
 FuptKPb6O6AohElvxTa+CsqDfwMViHHRdi5uoxm9d3YQjP+u0LIJSDCdsyAaHQ3zg/mg
 +Zc+7Jetpg1I89JhGOFTNPa1WVmyMr0hZ7YuRVveVVRoO17mNPxWZQghWcRZP9tauYKF
 V1sVPNHrgkyc/1aCrk7XenR+tVP70YvLwM2QxCq5Guc7U3AloLX4/icpe1Z8X51IMwPC
 b07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762965633; x=1763570433;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ka+oo3pgj2JB2kc973RtV4omtwTlaZBtkFnKjkUoQSA=;
 b=vcXAx92fkn4zcBRf6RCKw6G5neDt4mKyfx7WOl9rRv3V6nDdm3+2sxDBnTO8JX5U3G
 KiAhpUqKEIi/O5mpJZQOpqbkpdTO8s4PIAeNtkK5fmxrJqtxZpbjGRgQ/xIupXH1PH71
 4YVAgviv9HrixQgdAgmveG8SrGxn0F7S1F2b1Azf+/LyvbsgZVUE10reLCy8g6/rsetq
 1fGlXBK/xZzdt0vcY0p8frMauoZrMOpFyS5f45YeRpfE+Sv7TdqblL2KTLIJMQPPYLwp
 T90/FSfAHWu3rZWGs+j7bA1PnYO4KI8E0qcasJMzhMtAc8ksVTXmPoWwmq6v1sVigK3k
 I2WA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2gkZ7GnLE1ySiSRYiIKH5HiaG0faEfhRc6F3JLmsEwNsl1whbtQ5ahB81UYwPBr9r/NGCMnvk3Gg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweOkC8frMkdXYzIRH43oWONis2+WLiJIOurNOaKfMOX+Xwgx3z
 jsGWPptCnPY+tI1oCRYx+hR2dKtrtR1xpI9bUTCB2mCH5K2pNdZFn+GxZPMNYPXQ0APP7PwJR/P
 nLLX8FnrJh3hHiXkrVnO7yoZCe+n5BOU=
X-Gm-Gg: ASbGncsvJS4mzJRSvGZe+SUtr++u+1ZLZDZxWmmG+wpFK3EsVlXMNHJOP7twmaBA9lW
 MuobtTle1OTy8wjvaxI3tHOzQFgWdtBnFbWpqnhCwDMFdCRI1prg8XBiAEk6DUSuePJHc673VDe
 6TzyecJ5a2jBdh9r4Ma9LwuHYJsy9vsFaXpNwOcG3Hnj0YubeXQ8L8cIyBytj+2o9hiDnHeZ57R
 mmpHXc27+ZFWMBMVpfoe/bOrwFtPftdSHOtYUuCLtgfNotuX00tpE5fhw==
X-Google-Smtp-Source: AGHT+IGK44z86BN2OSnOpdaIYixeb9Hn2wTFfWJTLtnMDWPUJTmZR96qPQq4/NfFd6A9d51DPL2ZhfKVYst5wfWiYj8=
X-Received: by 2002:a05:6808:1b0c:b0:43f:63cc:aed9 with SMTP id
 5614622812f47-450745ae5cbmr1472885b6e.31.1762965632892; Wed, 12 Nov 2025
 08:40:32 -0800 (PST)
MIME-Version: 1.0
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
 <20251030190613.1224287-2-joelagnelf@nvidia.com>
 <DDX1WYWQNTAB.BBEICMO8NM30@nvidia.com>
 <20251104005812.GA2101511@joelbox2> <DDZYCRCPYMOL.RMTIF0R404Q4@nvidia.com>
 <CANiq72=Cj_gJ27+EAiytxYGYk1dMwu7M3xQpLGByD4QstgDsHw@mail.gmail.com>
 <CAAOQCfQ_d_C7oZ9uq2siJHn1+m+j059qYUMBvTWOnQ5Etk91ug@mail.gmail.com>
 <CANiq72nLzuCXh0r5W0HMM36f9yTSQfP9yCxXbzH+wS7VxFM2Eg@mail.gmail.com>
 <CANiq72kYYu9C94aY72HK1ELSmvktF3nq+G4+smdAW_Xaxw1kqw@mail.gmail.com>
 <CAAOQCfSRVqFZAJN_m-kGLe6fnqKYyhLUf_WOKdHHMW-C6NShkA@mail.gmail.com>
 <CANiq72nU7LOSEv=RsewAwiEbeO4=pTqg_pm+WJGfum90BC43kQ@mail.gmail.com>
In-Reply-To: <CANiq72nU7LOSEv=RsewAwiEbeO4=pTqg_pm+WJGfum90BC43kQ@mail.gmail.com>
From: Guillaume Gomez <guillaume1.gomez@gmail.com>
Date: Wed, 12 Nov 2025 17:40:21 +0100
X-Gm-Features: AWmQ_bkPOh4vHeoQWSet6WU-HZHFI2Z23pN6yKqCCaQUHSdDpwmkPCSibrem5WM
Message-ID: <CAAOQCfSu3Ej3K63iRcsBJLS0rEVBqjLqN0mE5VSGHyX7bVmU-A@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] rust: clist: Add abstraction for iterating over C
 linked lists
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, dakr@kernel.org, 
 David Airlie <airlied@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 nouveau@lists.freedesktop.org, 
 Nouveau <nouveau-bounces@lists.freedesktop.org>
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

Yeah that's what I meant. Ping me whenever you want to talk about it.

Le mar. 11 nov. 2025 =C3=A0 21:32, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> a =C3=A9crit :
>
> On Wed, Nov 5, 2025 at 11:54=E2=80=AFAM Guillaume Gomez
> <guillaume1.gomez@gmail.com> wrote:
> >
> > You can add your own tags in the doctests, and with our patch waiting
> > to use the new rustdoc doctests extraction, it should be pretty easy
> > to plug such a feature into it. We can check it together if you want
> > when the patch is merged to see if we already have everything needed
> > or if I need to add more things on rustdoc side.
>
> If you mean the `unknown` field (in the JSON) that I mentioned in my
> message, then yeah, I think that is good enough (though we should
> probably still prevent collisions with future `rustdoc` ones).
>
> If you mean something else that I may be missing, please let me know, of =
course!
>
> And yeah, we can take a look together (likely after LPC).
>
> Thanks!
>
> Cheers,
> Miguel
