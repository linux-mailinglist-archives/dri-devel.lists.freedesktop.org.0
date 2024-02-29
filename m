Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7956086CA45
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 14:30:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F1910E08F;
	Thu, 29 Feb 2024 13:30:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="WwN4zIQt";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="Du4iNjJ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout1-smtp.messagingengine.com (fout1-smtp.messagingengine.com
 [103.168.172.144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486E610E05E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 13:30:17 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfout.nyi.internal (Postfix) with ESMTP id 0C7A913800B1;
 Thu, 29 Feb 2024 08:30:16 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Thu, 29 Feb 2024 08:30:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1709213416;
 x=1709299816; bh=NSsh7wdQoTcz6RZE54bcC401nZ546MR2X4PMFL4r/ss=; b=
 WwN4zIQti3KuhM+GIzhHo23B4zVJW1qsndkm25LvtwJHAW6uTc2e9uOo6+33VU4v
 U9aEpGzCJbRf3uVsPPTDtKkgtCqPImnCgE5LfWXg1YfwzDcEKSmCBHHjlPKqbr8a
 wb3/hjcEljc+qKu2WyiVTdrLakW3VpPllTo8+KIK71agxeGjC7I1vDV2wNnUx+Eh
 kI1T/72FWc22q/RiPFRtntfXN2f7qNpy9LRMPjWLXdNIV2MX2onl/rm0iaNCXWkt
 73PPgRG9SM1RyhRO1Q2lzCRFa6KZ6WWE47hp7clvCsItsHY42F7Z7wOWBpJEbs/W
 dG+64fkgKYPQXf0WZenVKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1709213416; x=
 1709299816; bh=NSsh7wdQoTcz6RZE54bcC401nZ546MR2X4PMFL4r/ss=; b=D
 u4iNjJ5S5GtDxRZH6GmrvG5NkJJovPbnsiP/JkSSSZuZUelCNxtBWglBbBdGeZSU
 I3xZwTOzdXvxhy8E6wot0Iy9XOMI+PVWg3semGg/uKsKYOibNh487d/8RqSpVT9C
 APQ7G8aN+5QYRohDi5lm3eFNS94Dc6D3wYWROb9wysJXvXa7WTm0sKg0CAA6yE45
 N3NE4UQrDioKfm20ds36Wpf9RBlSlTpan/z0X10+IRiP5misonwhJTEjA4/Lx0QB
 dFinVQLs3cVIw8MIqp/IBqenrIACFyi1x+fYLd+JQR6rtZLifmbhJjnA8D6CYHUJ
 OaH8c6Ac6tHCLqhVOFobw==
X-ME-Sender: <xms:54bgZUBrVs7gcLcsyM7SfXnXeNXUdxMnyF_PoRMvW6QqixVEpp5Bcg>
 <xme:54bgZWhGHSawa5AtyOA-g-KqHTEl8wm1RJDrzdZ4v-VB5-5ZwyAQgp6ykkFWz7r57
 rSnKbNo0srQ-ldl1QU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrgeelgdehfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:54bgZXnC-Jagdk5VvcUTASxm1GZEyPavn8YOfbfCRsZhssjFFzatBA>
 <xmx:54bgZazvEkG8l6EuHRmBhyPNZGKeV2pu5L8GhAETpTl4GF0A0WYzGw>
 <xmx:54bgZZRYOA_9ZRyC2nsyYvm-FJCkWBRXsKkedJfFDUxZR7iuxR2H4w>
 <xmx:6IbgZbeF8zGZqUe3uXJqyPmlRfJlwDeJPmS9lDmUkdQ0C0gu05s10Q>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C8845B6008D; Thu, 29 Feb 2024 08:30:15 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-182-gaab6630818-fm-20240222.002-gaab66308
MIME-Version: 1.0
Message-Id: <06841e76-0a6d-4cbb-a903-1f2e5dfbaf46@app.fastmail.com>
In-Reply-To: <20240229105112.250077-3-matthew.auld@intel.com>
References: <20240229105112.250077-3-matthew.auld@intel.com>
Date: Thu, 29 Feb 2024 14:29:54 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Matthew Auld" <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org
Cc: "Arunpravin Paneer Selvam" <Arunpravin.PaneerSelvam@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 1/2] drm/buddy: stop using PAGE_SIZE
Content-Type: text/plain;charset=utf-8
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

On Thu, Feb 29, 2024, at 11:51, Matthew Auld wrote:
> The drm_buddy minimum page-size requirements should be distinct from t=
he
> CPU PAGE_SIZE. Only restriction is that the minimum page-size is at
> least 4K.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Arnd Bergmann <arnd@arndb.de>

Acked-by: Arnd Bergmann <arnd@arndb.de>

