Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89989A6AA5C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 16:55:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DDC310E657;
	Thu, 20 Mar 2025 15:55:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=db48x.net header.i=@db48x.net header.b="f92PAHz9";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="pWbUC/SZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-a1-smtp.messagingengine.com
 (fout-a1-smtp.messagingengine.com [103.168.172.144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A0810E657
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 15:55:02 +0000 (UTC)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfout.phl.internal (Postfix) with ESMTP id 9EB2A1383446;
 Thu, 20 Mar 2025 11:55:01 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-10.internal (MEProxy); Thu, 20 Mar 2025 11:55:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=db48x.net; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1742486101;
 x=1742572501; bh=TjbqBCbLA8NWX59i5FOeG9AwtG5k4TfiyzQOVtNKUJM=; b=
 f92PAHz9acjmk3qfyhM61KE1L9dyP/rTGEg1KIoLTQsAPrAW3j9Xxu6F3PMKu1VZ
 eTvDyxpX266c4vH0vWeyOp9/kHEoD+SmMsS1qdx7Id18bW9zYx42XPj9GWo5zacz
 /qxlsU0rtLwnKskvPat1fZk9t2spgL8esLc80GWYlgo6TxdyuqUu3rnDJeWuvkP7
 VExoKTDUv4BRwfhm3HocIuLu5fBMPlskSPYqJ9CTkEG3stdAgnzpGqhL3N75CVCl
 buNU2Axq39NuhElLYmxbNStyR7iMmrDFnb1eHAFpCAa24IX/C9FZBnV1aN/iaEUh
 odwj6SppQo+we4A38jGVoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742486101; x=
 1742572501; bh=TjbqBCbLA8NWX59i5FOeG9AwtG5k4TfiyzQOVtNKUJM=; b=p
 WbUC/SZ3m6QQTTQ0g8IEfSeBOJnjZ8dhYW8IFz0LIK2/daIlqXG37M66HB8VIdp8
 pYSn/JqtF5rUwy96qJB+oZ91wYVUO4dgdqsQrOdrKxH8eyzOZJW7W9IsmZgxbbbi
 g/zpOjaLF3EVy1dlwvvRcCatx9Z71440Zrbkp85a6coBeZmt13iureAHODXpLmUL
 II7X6KSOCJcDvlaaaI2usEfGaTr+zZ2UHCSpjSiYR2aSLxh5xBUWk4XIuJJBGBDa
 7MX1/9465LBM87LmZUQjT4rWVP8KTUw3ke/Bgy90JepjpUUwbw2SG+TnFvmUFBvs
 5rrAP/11soUe/Rhk3iRfA==
X-ME-Sender: <xms:VTrcZxl9mVbzL0uge9aAox1tv6xoLvvH2uxFqFecMGFVyzUfoC22GA>
 <xme:VTrcZ83VwA4jI7AACmLisX1ww7Cd9oSz0VVJjiuFvnn7L5mDlXhVIV4jIxqR81rJF
 043rE1Ns8haeOENEg8>
X-ME-Received: <xmr:VTrcZ3qOjV6xcUdUtmH8wIMJh9m-7p1hAf9xwvw0xfFFI6vZtgOyFuRUNjurUug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeekiedvucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnecujfgurhephffvvefujghffffkfgggtgfgsehtqhertddt
 reejnecuhfhrohhmpeffrghnihgvlhcuuehrohhokhhsuceouggsgeekgiesuggsgeekgi
 drnhgvtheqnecuggftrfgrthhtvghrnhepvdduteegieeujeelieejleetffdtjeeifeet
 vdetteejkeeuueetgeduveejkeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomhepuggsgeekgiesuggsgeekgidrnhgvthdpnhgspghrtghpthht
 ohepudelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegurhhiqdguvghvvghlse
 hlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepnhhouhhvvggr
 uheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehruhhsth
 dqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehl
 ihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhope
 hsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepthhmghhrohhsshesuhhmihgt
 hhdrvgguuhdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprh
 gtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
 sggvnhhnohdrlhhoshhsihhnsehprhhothhonhdrmhgv
X-ME-Proxy: <xmx:VTrcZxmyotkBHWBUAIHEIdtSZTonjXSHrXlbuXDaIHsP-TPqYn6B7Q>
 <xmx:VTrcZ_0OmO_ANVxNQsPx0VtQhsC3movZLdkYAUO1lnW_u2ar0Vlixg>
 <xmx:VTrcZwtMWFlB6xO1u63EYZxsmR3DZb0EDLhULUPz4d1MA66OwoQ2oA>
 <xmx:VTrcZzXUq3Uid0b-NrarYAO1TLGZaJkCcwwvlsXkBToQQwKxPeczcA>
 <xmx:VTrcZ06P8yYCSNy9cuPEZE39GMVL2CxXD8pftguBL50R17s_H8UtHyuJ>
Feedback-ID: ie0194691:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Mar 2025 11:54:58 -0400 (EDT)
From: Daniel Brooks <db48x@db48x.net>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>,  David Airlie <airlied@gmail.com>,
 John Hubbard <jhubbard@nvidia.com>,  Ben Skeggs <bskeggs@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>,  Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,  Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,  Benno Lossin
 <benno.lossin@proton.me>,  Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,  Trevor Gross <tmgross@umich.edu>,
 Simona Vetter <simona@ffwll.ch>,  linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,  nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH RFC v3 6/7] gpu: nova-core: add basic timer device
In-Reply-To: <20250320-nova_timer-v3-6-79aa2ad25a79@nvidia.com> (Alexandre
 Courbot's message of "Thu, 20 Mar 2025 22:39:14 +0900")
References: <20250320-nova_timer-v3-0-79aa2ad25a79@nvidia.com>
 <20250320-nova_timer-v3-6-79aa2ad25a79@nvidia.com>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwBAMAAAClLOS0AAAABGdBTUEAALGOfPtRkwAAABJQ
 TFRFpKfbdou67PD6JjJgAwUWXGSeIcyLHgAAAkZJREFUOI1VU8Fy6yAMxLi+Q13fCZ3cnQL3dqTc
 7RD+/1feStDXVnXHDuvVSivZTMba2GPdw3gyCGcMAFxTyrTd9dwGoxHiZX9PmRFUHYAQlGGtXY+F
 Uk0SJOxgJiUEnH1qkitT9D+pQub7qGAmUbR6bu3CvI96Yv6QqkBBMrsyfZccr1/RDXGDTLf4P7ZY
 glVxe2V+/ACXWO1gvDO9/gDRpFFVmPluvLcmBjd5H6d8DEte+Pbk4rcY/Fa5tLKLOtCZsuQKYhpa
 LOkYDT7hESya7/WIET3lfQBqX0pwFtbI832Is0ayMUR9B+12xjgPCQ089cfwkCkX6L5TPmRelJTh
 zMS0Sz1PyjLAMCUWjcmgQLWQMds+e3aaauZDf9dU9A2/8kPVF2odCUoMKHkfjJR+mbgC+DRiycw5
 3XSqGe6HmhN/AWjHypkAXOAFW5EiuA1ge2GiZuMb0s1fSEXcATeLUfbyEY2L8yPOmdSsdghQXx3K
 pz2eoeXuYvMCINVFDrCdNfVUp4eJ6cSEbjbgFjBEvonGGTrgv9cHjAc8aVgSAPoxaONbzfwhDIhR
 at7IIS7fAGiDSwIA9alhhTBzfA7YM2FY6eMwayrIGK8FDFmshmUA43WqhFtpvoqG9HHaJ7fqtgTz
 8EWVkgZgtsylFliHDgk0MB7KAEC45C/rgnGvanNLXyzOeTzcT2nw/N44gfrtYXRQLoz9Q3TgmJRx
 2Mx/Q51qzpm+l3m8z2SWBqC5+PZXAtNYlGFf/gKfHfjFkDT4x7od7R+w3Ls+ZdQBuQAAAABJRU5E
 rkJggg==
Date: Thu, 20 Mar 2025 08:54:57 -0700
Message-ID: <87v7s3zoha.fsf@db48x.net>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Alexandre Courbot <acourbot@nvidia.com> writes:

> +impl Add<Duration> for Timestamp {
> +    type Output =3D Self;
> +
> +    fn add(mut self, rhs: Duration) -> Self::Output {
> +        let mut nanos =3D rhs.as_nanos();
> +        while nanos > u64::MAX as u128 {
> +            self.0 =3D self.0.wrapping_add(nanos as u64);
> +            nanos -=3D u64::MAX as u128;
> +        }
> +
> +        Timestamp(self.0.wrapping_add(nanos as u64))
> +    }
> +}

Perhaps I missed something, but couldn=E2=80=99t you simplify this method l=
ike
this:

    fn add(mut self, rhs: Duration) -> Self::Output {
        let stamp =3D self.0 as u128;
        Timestamp(stamp.wrapping_add(rhs.as_nanos()) as u64)
    }

db48x
