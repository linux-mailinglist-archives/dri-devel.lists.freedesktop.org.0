Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B03BB8055
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 22:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C556510E210;
	Fri,  3 Oct 2025 20:03:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="MAHJne4z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C7D010E210
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 20:03:04 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-b3e25a4bfd5so528585466b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 13:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1759521782; x=1760126582;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TbpBU6Pr6wg0+zanKq2gcbiJR41DcWJOWgfowfisJWk=;
 b=MAHJne4zrHcjnK/DzzRgYZjcvjwjVrMfAMqIh/+V77V9gG+KwgZ2OsEEoZb+ve1mdo
 xCiLh95Ms2JtuwFIcKkef3vjdFjGvqqt2+lFuyEx/FsdynPGJoKnFjtxi85w/OizHXde
 q6NdiiTHfq82yW6az1SJYxh2ygOflraITiPYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759521782; x=1760126582;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TbpBU6Pr6wg0+zanKq2gcbiJR41DcWJOWgfowfisJWk=;
 b=qJwICvydbsyuObFqwhCqF0ntNOib47yw997jDZAHXMuBtWGKlupxq4xjrBBvL0MTbt
 guI3B8wA9JwL0xW+5Q/+1mtdIpJkOTnM6hT0X6A3i44Qn2rZWeGyoVQRK8o9C0XfEOcH
 j8vDBNRU+SV5Gu0mOqZRCpYP9lMVPUQf3QLNIP77jolb+cr93j9cQ6InNn4zUlfvUf9E
 IU90F405HgvcxXGXRz/z6l3hzyDk3e1nwK9DhwkbFmSvsEminUXOitNiJu5+Aa9pEyZD
 YUMflvpC6faYUP284TM8jHDhzC34OizgXr/hxPAArYAfiSHMPWV9oWa1QRj22pn0KwGI
 ngyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQpZCZNVA4LITvElvML4PdcpdTLeYymthFcr8koxSXozcxVURLcj6pGL+ek8K8ymOFzSKTglc/rxU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyojqWyJrNLKguHhHv57LFleeLTnbvu8gu7AhkDi30yw1yJST9C
 vo/sLqC1Q/1RYw8qBHOhzdrmlyWfA/2++gkFbl8MasKd1BLuEsaoiiuTMMMewO27cup8kI1kS1y
 jwTeF0+o=
X-Gm-Gg: ASbGncvOYULnscmu4GUSoXfS7Qp2rFzayDTvGYbQVtwS79jVmT9a3XcW/nj0jt/QHkJ
 1KwTD7+gB/lIboY0aSsqN/GUgJGgGWlQAFSRk734LOICmg5bu4jFGqpgwR7cJJLVOwdk6NZgsVG
 l175nf4rCg2S5kUh5InPqkPoO8HlbhYVIdz6jQm6zpZvWFvb0gjRLw72ejGD9ptU0BRQ/jK+KuY
 hqcZn7+SHBWpi97iQZPBZ7DgE0kGQUj+a51wkk6vXcS4wRByBniZq3N9XAz/2P0FFAfDRcQ99zc
 MpwH05eTu889tEPGTydqvzVJCf0cB4Glkd5xoym5BgCzX/2UDS4pDFsEhKIsOf/vktUE6JizQyx
 AeQohIgdEamEuXLOtPtrzCxqHeQbnIFQ8SaUx2l6b8K70hUXeqQXAsz1JK+mJww9E6ygl3E3bBL
 15HJes0Wiw4YbtxME1wLIE
X-Google-Smtp-Source: AGHT+IF9kwYypnTxGCNjtTqyn71+xQpafwbPsR9RywIZr2g1SEER99G8ApOfwwjNpfeN4G8QtLxw/g==
X-Received: by 2002:a17:907:868c:b0:b40:5dac:ed3f with SMTP id
 a640c23a62f3a-b49c1277b0bmr468778766b.7.1759521782487; 
 Fri, 03 Oct 2025 13:03:02 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com.
 [209.85.208.46]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b486970a60dsm506210166b.63.2025.10.03.13.03.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Oct 2025 13:03:00 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-6394b4ff908so2553783a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 13:03:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV2iZCfjKlDHswiwu94+GbIWZCM8HkLYlV23CYfR1+h6YvqXMeM7P1ftyoDYutqzO6eixmQnVCZ2DQ=@lists.freedesktop.org
X-Received: by 2002:a17:907:2685:b0:b45:1063:fb65 with SMTP id
 a640c23a62f3a-b49c3936225mr545475666b.39.1759521780061; Fri, 03 Oct 2025
 13:03:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzYUBfz+YmifRDgdBsuTL=FpBxQVfxu23it48kGRzJNPQ@mail.gmail.com>
 <CAHk-=wgO7S_FZUSBbngG5vtejWOpzDfTTBkVvP3_yjJmFddbzA@mail.gmail.com>
 <CAPM=9txjNo==nMA7XcjzLWLO155+1bk2THwPs_BmTLu_5kU_bQ@mail.gmail.com>
 <CAHk-=wgR61VxiHyOKXBJv_HinoFVA2av1EuSHg5NcRGC1fNq3w@mail.gmail.com>
In-Reply-To: <CAHk-=wgR61VxiHyOKXBJv_HinoFVA2av1EuSHg5NcRGC1fNq3w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 3 Oct 2025 13:02:43 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgX-2+hH5fM344_wKYNZS5CSf4ispS4X+s5xkma_Mdu_Q@mail.gmail.com>
X-Gm-Features: AS18NWCnq6HDu3oiSAI0ER2urw2inCCpn6nPuTO_WRSrmKvOgbDj_M8nr5oEaqo
Message-ID: <CAHk-=wgX-2+hH5fM344_wKYNZS5CSf4ispS4X+s5xkma_Mdu_Q@mail.gmail.com>
Subject: Re: [git pull] drm for 6.18-rc1
To: Dave Airlie <airlied@gmail.com>,
 Sasha Levin <Alexander.Levin@microsoft.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Sima Vetter <sima@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 3 Oct 2025 at 11:09, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> If you get pull requests from the people you pull from that make it
> harder for you to do a better job, please push back on them too.

Side note: this is actually an area where maybe it's worth looking
into just having automation.

I've actually been fairly impressed with some of the more recent
AUTOSEL AI summaries, and I wonder if it might help maintainers to
have some kind of "summarize this pull request" infrastructure. I'm
not so convinced about the code-writing side, but summarizing
changelogs sounds useful but also rather less scary.

And I'm not suggesting that because I would use it to summarize other
peoples pull requests, but as a way to make it easier for maintainers
to write summaries of their own pull requests when they have lots of
different things going on.

Adding Sasha to the participants, since he's been doing the AUTOSEL summaries.

(Some of them have been just garbage, but a lot of them have seemed
quite reasonable. So as a starting point - rather than as the final
case - I think maybe some of those LLM's might be useful for other
things than making amusing fake videos)

          Linus
