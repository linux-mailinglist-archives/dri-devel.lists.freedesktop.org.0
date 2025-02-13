Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6E2A352FA
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 01:34:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B53C10EBC5;
	Fri, 14 Feb 2025 00:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ronja.re header.i=@ronja.re header.b="EcmWx9yo";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="x3JF1fTt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 539 seconds by postgrey-1.36 at gabe;
 Thu, 13 Feb 2025 20:01:16 UTC
Received: from fout-a5-smtp.messagingengine.com
 (fout-a5-smtp.messagingengine.com [103.168.172.148])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC8E10E087
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 20:01:16 +0000 (UTC)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal
 [10.202.2.43])
 by mailfout.phl.internal (Postfix) with ESMTP id C47861380229;
 Thu, 13 Feb 2025 14:52:16 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Thu, 13 Feb 2025 14:52:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ronja.re; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1739476336;
 x=1739562736; bh=hBZh1E50TYghnLz92VGxm4YsBz6I+nkTA9ZWWpxdAFo=; b=
 EcmWx9yoB+WoclcvN67Mzc6cR5blzOdOYUNgHc3OZrnCgLgaUFrHMAxClgaub/hp
 E6yf54OkLfQF6ijEdk+6R4aSHzjh9qkfmrwJp/s3ZcQTEtQgr9dvI7qqlDjsqGmi
 7Miw9RQg37PprFPKYH5ukBxt0Z8jcXjudMmIH/ngBAaVwlTpxAfGcDtOduNSRS+B
 vT9oeCARRxdktY7BK+EP/hhTHzKni/BGfBxUyN6CE55BnuxhJE7T4Q6qBI/xQjgS
 EuZe9Cox9Jkgt6HOqOc01cuSrLzV4DKCntATyiA8v95OwvpMmE3b8XqsGLAO8duF
 8NGxRaKT1EAnEysjXn26bA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739476336; x=
 1739562736; bh=hBZh1E50TYghnLz92VGxm4YsBz6I+nkTA9ZWWpxdAFo=; b=x
 3JF1fTtnXYpNGJeilnYQzOMEyDaj5Zx4BAHRwNt/LHF2E7hCyWqNIrT5TZQU0Zrf
 VHUukhpWroCnJfIlbrJUk21WzeVUdKiOcYIatom+WWKqeSNzXkVZCHw2ONC2aaPw
 FtWwYQv+GIhZP/9A7gqFWO6OfBrcZQLiYt8boNPv3KIM3f8TuMn1GtW85iwYphp5
 eYKhGLhVfi6s4e1n8brESrlk7J3P7y8v+Nu14IXLZGoG/lP7Lk3fzCoggaO+07SO
 Y2o1biSM07VCcHB4vXMUww88afAA1350mAjP624qPwaR31P3lS+ftp2SQUt6mJZA
 sAvLPpC54STzlwaTcor3A==
X-ME-Sender: <xms:b02uZ9D0nZ1gfJXueusuJOgbJVxEWLjAlcdzlHt7aAix4ENurzPUHQ>
 <xme:b02uZ7g46l1goqI6B1WEz0pDMLDBUQCmDZvM6ELpC40jgYdEoZB-beUnJA0iD_D47
 xrv-TP5DOG_nDm1yA>
X-ME-Received: <xmr:b02uZ4nOrzzHw6M2DkzVlg1Thlcz8nzELAdg915666Zfw5ctJcoIfR9o8byiaNgwR0xUFAXEs5Mlr1svROveWbKX2k-xH-goSItl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegjeeiiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddv
 jeenucfhrhhomheptfhonhhjrgcuofgvhigvrhcuoehmvgdolhhkmhhlsehrohhnjhgrrd
 hrvgeqnecuggftrfgrthhtvghrnhepffefjeehuddthfettedvueeuieefkefhheehteej
 jeduleevtefhgeehteeviefhnecuffhomhgrihhnpehjohhfrhgvvghmrghnrdgtohhmne
 cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgvodhl
 khhmlhesrhhonhhjrgdrrhgvpdhnsggprhgtphhtthhopeeftddpmhhouggvpehsmhhtph
 houhhtpdhrtghpthhtohepthihthhsohesmhhithdrvgguuhdprhgtphhtthhopehgrhgv
 ghesvghnjhgvlhhlihgtrdgtohhmpdhrtghpthhtohepthhorhhvrghlughssehlihhnuh
 igqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehmrghrtggrnhesmhgrrhgt
 rghnrdhsthdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpth
 htohepjhhgghesnhhvihguihgrrdgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhn
 uhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepphhhrghsthgrsehkvghrnh
 gvlhdrohhrghdprhgtphhtthhopehhtghhsehlshhtrdguvg
X-ME-Proxy: <xmx:b02uZ3xymUNtpFWWa5H7dLBbaepfiVImJa4aFJM_5ahv-iFGYEi0cQ>
 <xmx:b02uZyTrxPNSashoUbV3FYxFqV5xrPv2zK6z7pB6t_xTvqUcT3Tc2g>
 <xmx:b02uZ6YSMTS0ZehgNykR8IWIRT1QyYJQBO0sBSgHaBxLOueBFLJ8mA>
 <xmx:b02uZzSmS-cfjxzK556kNfgEuElIaOpqI1hAzrArNhf05EWr9rWi4A>
 <xmx:cE2uZzeECUh2NoEmbRxxGyDeSp560rCRqPg5fwmkQJKJ4iP2ogD8EkvV>
Feedback-ID: i2f914587:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Feb 2025 14:52:11 -0500 (EST)
Message-ID: <93fe2066-f181-420c-a3e3-016c98c54035@ronja.re>
Date: Thu, 13 Feb 2025 20:52:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: On community influencing (was Re: [PATCH v8 2/2] rust: add dma
 coherent allocator abstraction.)
To: Theodore Ts'o <tytso@mit.edu>, "Dr. Greg" <greg@enjellic.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Hector Martin <marcan@marcan.st>, Dave Airlie <airlied@gmail.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>,
 phasta@kernel.org, Christoph Hellwig <hch@lst.de>,
 Danilo Krummrich <dakr@kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 daniel.almeida@collabora.com, aliceryhl@google.com, robin.murphy@arm.com,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, Bj??rn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <2025013030-gummy-cosmic-7927@gregkh>
 <20250130172437.GN5556@nvidia.com>
 <2025013148-reversal-pessimism-1515@gregkh>
 <20250131135421.GO5556@nvidia.com>
 <2b9b75d1-eb8e-494a-b05f-59f75c92e6ae@marcan.st>
 <Z6OzgBYZNJPr_ZD1@phenom.ffwll.local>
 <CAPM=9tzPR9wd=3Wbjnp-T0W8-dDfGah-H3Ny52G85B+2Ev9ksA@mail.gmail.com>
 <208e1fc3-cfc3-4a26-98c3-a48ab35bb9db@marcan.st>
 <CAHk-=wi=ZmP2=TmHsFSUGq8vUZAOWWSK1vrJarMaOhReDRQRYQ@mail.gmail.com>
 <20250207121638.GA7356@wind.enjellic.com> <20250208204416.GL1130956@mit.edu>
Content-Language: en-US
From: Ronja Meyer <me+lkml@ronja.re>
In-Reply-To: <20250208204416.GL1130956@mit.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 14 Feb 2025 00:33:52 +0000
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

On 08.02.2025 21:44, Theodore Ts'o wrote:
> I'll let you in a secret.  The maintainers are not "all-powerfui".  We
> are the "thin blue line" that is trying to keep the code to be
> maintainable and high quality.  Like most leaders of volunteer
> organization, whether it is the Internet Engineerint Task Force (the
> standards body for the Internet), we actually have very little power.
 > […] structurelessness becomes a way of masking power, and […] is 
usually most strongly advocated by those who are the most powerful 
(whether they are conscious of their power or not). As long as the 
structure of the group is informal, the rules of how decisions are made 
are known only to a few and awareness of power is limited to those who 
know the rules. Those who do not know the rules and are not chosen for 
initiation must remain in confusion, or suffer from paranoid delusions 
that something is happening of which they are not quite aware. […]

 From "The Tyranny of Structurelessness", written by Jo Freeman in 1970. 
https://www.jofreeman.com/joreen/tyranny.htm

- Ronja

