Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEB8BDCD4B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 09:10:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E055F10E264;
	Wed, 15 Oct 2025 07:10:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="pIMAy7US";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="boCC31Uv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-b3-smtp.messagingengine.com
 (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4DC10E264
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 07:10:18 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfout.stl.internal (Postfix) with ESMTP id DA4AC1D00075;
 Wed, 15 Oct 2025 03:10:17 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
 by phl-compute-05.internal (MEProxy); Wed, 15 Oct 2025 03:10:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm1; t=1760512217;
 x=1760598617; bh=nFNokHi/WzeVa5PH2mR5LLVWP7WWc0ISJYIPyJ+q7z0=; b=
 pIMAy7US4Y+ijfMOhbsx399Avwmn7SnDDiT6aVV/r6mYjP8tzg3NdkJMwEGuY+so
 pd0x58jbpw9NmE9Dw2SC04EGtawy2EETosTalw6hsRrgYPD7bKJ2q9GFIo9lYW2/
 9Z9+p0Lb0Ke2FOmW57j08A3qri4U9qc/uPjGtDv7nt+e1eaAQdXL3SR4Bv23XJB4
 jMnGAcz5T2mGgYdBOkMguAEa3ZRDdOJIMYYOXiroiT8CFjMt7NNPCjTA0uXCrWq/
 q8w6rpiUivxdKDtRj213Xe85ZQgG5F/pGLA626R7ILDnBc0cG52FbrhGrMPM3udC
 INfye2qmvSC30TcBKm6wmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1760512217; x=
 1760598617; bh=nFNokHi/WzeVa5PH2mR5LLVWP7WWc0ISJYIPyJ+q7z0=; b=b
 oCC31UvD4+hiXV6BCMdfucTMX+UexoljhaF1+oOh9Mpu6c2p9thql8kxH3hQq89B
 PUfT4s52vikdUNDrCZiMmLhDCYPHl/OM/2HEIOMda7KiEXDTqyVOfkj9sMFW5Vrn
 z3aHLUaXsq0dtyc/AI3+li9SY13BoO3uVx5pvQ/YqhoYfi8r4zLWrG5G3ptc6u/b
 tQNIPyqIamxrJbbg2+PS+xbCEptjfO19b/YkBRp2yfg52nvI6Z/3TSwqY/lbn8Qx
 tGQpZ5XbpzaAYCvaGrh7OIbPoJa+7488AglxNw2f+J7Up7oaQcoBgATt7/Cn77Mp
 hkU6tivPW2xEQLlI34PuQ==
X-ME-Sender: <xms:2UjvaKhVJ_wWhWmKlw7vn-2BM6-8tq5p8DJxqqXXVAozMBk2E7HOIA>
 <xme:2UjvaF08IzbVUvoH1PNuT6aRcVrZ4VbdJtLmnIU4fDrYh5qNBnJGmfaOMgJqXucs4
 _XXCG4yNaaD6Oqn0CXqIlCHLEODc-uinVaO3WjjTbMGf4BVpSUwBo3j>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduvddvjeejucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
 uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
 hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
 necuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
 gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudegpdhmohguvgepshhmthhpohhu
 thdprhgtphhtthhopehsrhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrh
 gvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopegurhhi
 qdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoh
 eprghiqhhunhdrhihusehoshhsrdhquhgrlhgtohhmmhdrtghomhdprhgtphhtthhopegv
 khgrnhhshhdrghhuphhtrgesohhsshdrqhhurghltghomhhmrdgtohhmpdhrtghpthhtoh
 epjhhinhhghihirdifrghnghesohhsshdrqhhurghltghomhhmrdgtohhmpdhrtghpthht
 ohepkhhumhgrrhhirdhprghllhgrvhhisehoshhsrdhquhgrlhgtohhmmhdrtghomhdprh
 gtphhtthhopegrmhgrhhgvshhhsehqthhirdhquhgrlhgtohhmmhdrtghomhdprhgtphht
 thhopehkphgrlhhlrghvihesqhhtihdrqhhurghltghomhhmrdgtohhm
X-ME-Proxy: <xmx:2UjvaGECYRhCQlIQVItARlKccnBiUi6GwJAWpxH_k2ULhbGmbKf3kw>
 <xmx:2UjvaAt1Q6qDPwze8_lD_Oehmr24J3Fvyr26_m4nGWXwUmKRKyC6-g>
 <xmx:2UjvaIr1A1rQAnLJeuOQs1pGXdP-OKCc-vXewRF8Zn_qjX-P3T-qNQ>
 <xmx:2UjvaPkFuiWsOB_kZj6S9voPxQ3NsEgo5KWi_PLe403EIN7oNsvP5A>
 <xmx:2UjvaJ0T39pEdaQwa50OSmwt_b5Wbyb0rpJzxbeOJheFm8bfKEYVORkV>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 57A57700054; Wed, 15 Oct 2025 03:10:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AFtoOdvkewRR
Date: Wed, 15 Oct 2025 09:09:57 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Kumari Pallavi" <kumari.pallavi@oss.qualcomm.com>,
 kpallavi@qti.qualcomm.com, "Srinivas Kandagatla" <srini@kernel.org>,
 "Amol Maheshwari" <amahesh@qti.qualcomm.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: quic_bkumar@quicinc.com, ekansh.gupta@oss.qualcomm.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 "Jingyi Wang" <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
 ktadakam@qti.qualcomm.com
Message-Id: <ac42d5cc-1db9-4e81-8613-ca1ac9cff9d2@app.fastmail.com>
In-Reply-To: <20251015045702.3022060-3-kumari.pallavi@oss.qualcomm.com>
References: <20251015045702.3022060-1-kumari.pallavi@oss.qualcomm.com>
 <20251015045702.3022060-3-kumari.pallavi@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] misc: fastrpc: Add support for new DSP IOVA
 formatting
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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

On Wed, Oct 15, 2025, at 06:57, Kumari Pallavi wrote:

> @@ -2291,6 +2319,22 @@ static int fastrpc_rpmsg_probe(struct 
> rpmsg_device *rpdev)
>  	const char *domain;
>  	bool secure_dsp;
>  	unsigned int vmids[FASTRPC_MAX_VMIDS];
> +	struct device_node *root;
> +	const struct of_device_id *match;
> +	const struct fastrpc_soc_data *soc_data = NULL;
> +
> +	root = of_find_node_by_path("/");
> +	if (!root)
> +		return -ENODEV;
> +
> +	match = of_match_node(qcom_soc_match_table, root);
> +	of_node_put(root);
> +	if (!match || !match->data) {
> +		 soc_data = &default_soc_data;
> +		 dev_dbg(rdev, "no compatible SoC found at root node\n");
> +	} else {
> +		 soc_data = match->data;
> +	}
> 

Matching on the type of the root node is not great, as this
is both a layering violation and does not scale if you need
to do the same thing for future chip generations.

Normally this should be matched on the device compatible
string itself, or possibly based on one of its properties.

If this fails because there are already dtb files in the
open that have to keep getting supported and there is no
identifier in the fastrpc device itself, you can use
soc_device_match() as a last resort to match on the the
soc.

    Arnd
