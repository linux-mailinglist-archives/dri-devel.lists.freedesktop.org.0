Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 685677E31E5
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 01:03:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4364C10E475;
	Tue,  7 Nov 2023 00:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0630410E475
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 00:03:24 +0000 (UTC)
Received: by mail-ua1-x936.google.com with SMTP id
 a1e0cc1a2514c-7ba9bd62fdfso1559758241.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 16:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699315403; x=1699920203; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cjOyMk9SzKBIBazjv/h8e6iW+SY3zc4TCme29hNVYak=;
 b=e3BY5Y/1l6OYlLqHfSH8C95dQWn9mNGJmvGZv7Bq+hyzlk2Krh8qS2gigOtQHj5Gx0
 e7saV624AVTUvnnmwT3hbwl2eqajeki9h6VdGFhWF+TbGuihYJkNeU2SmDZ6Ns+O8XY3
 T6rjE8CoFto1c6bfwqQEq/CpB6XKDAd059Jjwl77FWjS33c6KU27gu4G2EBfUDvuSCl6
 GbUVipCOEMR+SzcpoOaI8XkJa72gJLzFWsx1bxiyqtMlZK9R/hCS/UKOoYFRqOmgds/F
 ap+rP0eT3BpNISVU0CeSvaDekOW0ATHx7H8fPQoSXn5urvNRq7hblH1x8nZZ6b3z8Fnp
 iTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699315403; x=1699920203;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cjOyMk9SzKBIBazjv/h8e6iW+SY3zc4TCme29hNVYak=;
 b=s4ZdCEKHde6QwMKFWk440VSdd++8VDTPkuGgHKy47nOUn+WOJHW4N8NX0LhDKXilHD
 WzHBbX8oEOzHq/BZzPelXwbcrv7mWfpox+e2VjaCgxbdiwqPGKrr9lruv/vzHSePUlf5
 oC1RlJGp6rVqmel4RIW5RLr/k6bhbkY7+FeaeUkgljiBj1hBr8w0QYDcboo9JHhlInQ5
 4kRLBrbtUwXWloEhfLnNPwqBrv2l5Ki5TBuyija7VqJ4BAoVLRFv9fr2DaqiA5nw6WY4
 By+ifinF54zI8O5AKU6Mal0D10cImbHuVnATvxX5eAoyxq2+FYsZcIU9xzKaGly0O06/
 XyVQ==
X-Gm-Message-State: AOJu0YySE63TgSbA47CjneCnKxK73RUgHtShNG5B9PgVezqqd9FBe7/D
 Iv+TOWD8yyGAeqXvP8SdnXJKratGFe69wgAPa1s=
X-Google-Smtp-Source: AGHT+IEbiDtM5YXu/PhpE4XQuotEwU4Ndp88Nl6MwVDyldKJxTkPcynL5M6yfEk9QmT6fckOqnpR4Bj4udSwGIkYfHs=
X-Received: by 2002:a67:e1cd:0:b0:45d:9e9e:6183 with SMTP id
 p13-20020a67e1cd000000b0045d9e9e6183mr7172136vsl.7.1699315402987; Mon, 06 Nov
 2023 16:03:22 -0800 (PST)
MIME-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-11-almasrymina@google.com>
 <ZUk0FGuJ28s1d9OX@google.com>
 <CAHS8izNFv7r6vqYR_TYqcCuDO61F+nnNMhsSu=DrYWSr3sVgrA@mail.gmail.com>
 <CAF=yD-+MFpO5Hdqn+Q9X54SBpgcBeJvKTRD53X2oM4s8uVqnAQ@mail.gmail.com>
 <ZUlp8XutSAScKs_0@google.com>
 <CAF=yD-JZ88j+44MYgX-=oYJngz4Z0zw6Y0V3nHXisZJtNu7q6A@mail.gmail.com>
 <CAKH8qBueYgpxQTvTwngOs6RNjy9yvLF92s1p5nFrobw_UprNMQ@mail.gmail.com>
 <93eb6a2b-a991-40ca-8f26-f520c986729a@kernel.org>
In-Reply-To: <93eb6a2b-a991-40ca-8f26-f520c986729a@kernel.org>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Mon, 6 Nov 2023 16:02:42 -0800
Message-ID: <CAF=yD-Ln4v8orUne8E7D2_eHu39PWPCrMR3Qtuh312pCu=erng@mail.gmail.com>
Subject: Re: [RFC PATCH v3 10/12] tcp: RX path for devmem TCP
To: David Ahern <dsahern@kernel.org>
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
Cc: Kaiyuan Zhang <kaiyuanz@google.com>, dri-devel@lists.freedesktop.org,
 Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@google.com>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Mina Almasry <almasrymina@google.com>,
 Jeroen de Borst <jeroendb@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 linux-arch@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linaro-mm-sig@lists.linaro.org,
 Shakeel Butt <shakeelb@google.com>, Willem de Bruijn <willemb@google.com>,
 netdev@vger.kernel.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 6, 2023 at 3:55=E2=80=AFPM David Ahern <dsahern@kernel.org> wro=
te:
>
> On 11/6/23 4:32 PM, Stanislav Fomichev wrote:
> >> The concise notification API returns tokens as a range for
> >> compression, encoding as two 32-bit unsigned integers start + length.
> >> It allows for even further batching by returning multiple such ranges
> >> in a single call.
> >
> > Tangential: should tokens be u64? Otherwise we can't have more than
> > 4gb unacknowledged. Or that's a reasonable constraint?
> >
>
> Was thinking the same and with bits reserved for a dmabuf id to allow
> multiple dmabufs in a single rx queue (future extension, but build the
> capability in now). e.g., something like a 37b offset (128GB dmabuf
> size), 19b length (large GRO), 8b dmabuf id (lots of dmabufs to a queue).

Agreed. Converting to 64b now sounds like a good forward looking revision.
