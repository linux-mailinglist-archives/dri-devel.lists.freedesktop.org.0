Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBDBCA3DE0
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 14:43:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A253910E987;
	Thu,  4 Dec 2025 13:43:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="LQos2MMm";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="ALmT0/5z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-b6-smtp.messagingengine.com
 (fout-b6-smtp.messagingengine.com [202.12.124.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1071810E987
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 13:43:22 +0000 (UTC)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.stl.internal (Postfix) with ESMTP id 1EAA11D00247;
 Thu,  4 Dec 2025 08:43:22 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
 by phl-compute-04.internal (MEProxy); Thu, 04 Dec 2025 08:43:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1764855801;
 x=1764942201; bh=iEOK4GHJFzlsjBYVSzufLC/KxEyKi30dEY4Fl9sf1EA=; b=
 LQos2MMmMkOzrO0mM5OBINHgXBMQc+s4XMiJGwcl/fNr+2qr62bc/uPAObcgiDbd
 KMdpR54mY7xFme2LlwhLH8JrKnJEPjsg7BXuyFMDKt8haSTfEbnn5HmshnDo9l0v
 jeWZ69UgSsQwxFhqZw+uyg3sqRmwndJ/qX5ZlFgpcvgZbp7+dZDK7ZyzJGxsllaY
 ZhCqkEfW+jnXbI4M96vjDcgOXVstWyI2KLKGLt8V5scUQo9y5rN9cD/OVAOOlp8w
 LKQc6KVzDe0QfZhXTp/CUwujN5eDx7Hgesd661oURCTIffDPoyZeGT4YWtHdNH88
 hz/O7efn7mDC42lccRdgPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764855801; x=
 1764942201; bh=iEOK4GHJFzlsjBYVSzufLC/KxEyKi30dEY4Fl9sf1EA=; b=A
 LmT0/5zt5v9F3G70Htc3NnJtJIJUGJU3HijTb2kD8Ql1Lx8HtQFGuaU3sgrbRKq2
 h6UT/kWDlP5AYKcx5NN7yfeovI/utU+YVJMoIAXpuP0FA8mEWi+/PlnWqeJaIsYl
 1mhHOeacpms6WsYlwgYZqCDYHVsKfdkiPM/RKTnwIXOHX2Q/OGjAo5rbPMyNGvYc
 5wrwfOBVtUjStDi3mDcF6l6h0DUN5Xla6pcJS/6v4QkS4LBa0BB9oI9VZP/tgDX5
 5ka9+dzXqLR8eWPszAwBS8JcgZGFNLc/QNVO8MH1qOjxm+qswD4hrg1ynnt/r7hY
 rs9wpZnXfRN/Bbtxe3SnA==
X-ME-Sender: <xms:-Y8xaUQpfXES8MNjfXCsM5H5resGVls5nqkbBBAupUqOv-nZbsaOSg>
 <xme:-Y8xacl9nKPs_kVhu2RzxAbEilljHv1Yuyz6ye_5CKNEECdOwrQRZhrv9hM5e_psz
 y-NaFZEMZs3HTA7X0xhlB6Chn63_R1djek6LD2PZePN-UUJGPSLQg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdehjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 epofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhguuceu
 vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
 epvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleejnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguse
 grrhhnuggsrdguvgdpnhgspghrtghpthhtohepudegpdhmohguvgepshhmthhpohhuthdp
 rhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghirhhlih
 gvugesghhmrghilhdrtghomhdprhgtphhtthhopehjrghnihdrnhhikhhulhgrsehinhht
 vghlrdgtohhmpdhrtghpthhtohepmhgrthhthhgvfidrsghrohhsthesihhnthgvlhdrtg
 homhdprhgtphhtthhopehmihgthhgrlhdrfigrjhguvggtiihkohesihhnthgvlhdrtgho
 mhdprhgtphhtthhopehmihgthhgrlhdrfihinhhirghrshhkihesihhnthgvlhdrtghomh
 dprhgtphhtthhopehrihgrnhgrrdhtrghurhhosehinhhtvghlrdgtohhmpdhrtghpthht
 oheprhhoughrihhgohdrvhhivhhisehinhhtvghlrdgtohhmpdhrtghpthhtoheprghrnh
 gusehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:-Y8xaSja_cSVvNkGa49d9Z8qvBrVfGn9KRwhppR2bwW7CngTGS6GAg>
 <xmx:-Y8xadbnKkaK5ST9ZuBBnuu1cI9lHQGoGnOJqgrV4Cj5ZVaM86eGFw>
 <xmx:-Y8xaQOanWaeukQSqoFrZJPyX183Ehr-1g1a2-hcFuF1ZtiaXaYuBQ>
 <xmx:-Y8xaWZppPmjB3iwGaLUr46_oAU2WFLBbLlmCx723HJbVlXHn5nJDQ>
 <xmx:-Y8xaay8TzrSNzt9eIQKkIf6R9RkvyUU7ux4A5FMdcSxBBJAWbFiaJ5h>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id B1297C40054; Thu,  4 Dec 2025 08:43:21 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AYn5IVckS1wN
Date: Thu, 04 Dec 2025 14:43:00 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Arnd Bergmann" <arnd@kernel.org>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Dave Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: "Matthew Brost" <matthew.brost@intel.com>,
 "Lucas De Marchi" <demarchi@kernel.org>,
 "Jani Nikula" <jani.nikula@intel.com>, "Riana Tauro" <riana.tauro@intel.com>, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-Id: <079b5829-1ebd-4df8-873c-b75625a52fac@app.fastmail.com>
In-Reply-To: <c174c12d9748e2e9b2e497c1e479100c323e79c2.camel@linux.intel.com>
References: <20251204094154.1029357-1-arnd@kernel.org>
 <c174c12d9748e2e9b2e497c1e479100c323e79c2.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe/pf: fix VFIO link error
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

On Thu, Dec 4, 2025, at 13:19, Thomas Hellstr=C3=B6m wrote:
> On Thu, 2025-12-04 at 10:41 +0100, Arnd Bergmann wrote:
>>=20
>> Check for CONFIG_XE_VFIO_PCI being enabled in the Makefile to decide
>> whether to
>> include the the object instead.
>
> s/the the/the/ found by CI.
> Same question here, Do you want to resent or should I fix up when
> commiting?
>

I'd prefer if you can fix up both so I don't have to send it again.

     Arnd
