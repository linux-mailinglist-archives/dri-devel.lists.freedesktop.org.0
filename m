Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0O3XN0ashGk14QMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 15:42:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EE1F42CB
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 15:42:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F7110E8E2;
	Thu,  5 Feb 2026 14:42:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=shazbot.org header.i=@shazbot.org header.b="FEf0h2Bc";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="fVLT4mfc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b3-smtp.messagingengine.com
 (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B2810E8E2;
 Thu,  5 Feb 2026 14:42:11 +0000 (UTC)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.stl.internal (Postfix) with ESMTP id F0A547A0066;
 Thu,  5 Feb 2026 09:42:08 -0500 (EST)
Received: from phl-imap-18 ([10.202.2.89])
 by phl-compute-02.internal (MEProxy); Thu, 05 Feb 2026 09:42:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1770302528;
 x=1770388928; bh=c2sWSFRwhN1ePbWw0hSzzDPUGT+PUV51S0w9MOaIyks=; b=
 FEf0h2BcDcZm7G7BDIUK2ADItpwlJ8hNuUMLpKhFD6n01D8okyPnIkq6p81we7L2
 gIGJ48i+i29M8SF5Umc+j2/hErScJ0HodPUYKew263UE3GLZrJ7hD+mpi7tA1tUX
 CroIkGk60T8vo4V9I7Cfhb2SMhUSeAwP0kh/1pkZh1xJdlexYo0FdJ5ZcBnF22Gt
 PcO5FnudagrbQTbq0nW/uUj4MwbWv0LJvy4TiBkSF9/3dPJ/dW8TAz3yrrKGyEcx
 SXgih4Qq3eCnWAJL/lyYSLwmbXucwl6AUKa54xqHfBzVVIvuk+of2gbkMwwAHZlf
 LV4/00+M10ZETI1nm733Ig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770302528; x=
 1770388928; bh=c2sWSFRwhN1ePbWw0hSzzDPUGT+PUV51S0w9MOaIyks=; b=f
 VLT4mfcVhduoy9qAwuHpxbxsvmL9WGkexpwwI35BBhmw8JlDnXBk4zHMMQX1hHA6
 4z5QJMxDN/5SU6v2/oB5bORew2XZ927YqZSyGTD1rcl9RdbaPe9yUSI2BgRvAFmc
 BzOn8OvFG5gzR5jsTizMM+6Q1M4c3zFzIFNxlcJnGt15yhJ9kNlOoAJxgBhI4IXo
 HYOdBlgGo0Cb+dwdnPpC3xPczHpGadbVzQgJTrwGwpj8XbRm5Jx/FcIuWT1z2tvu
 m1hBZ0WCbh+BnVOK3X+cMcFnDmQXkToA8t1ygsnVaHAwifuFcHKpaN9hF3Ey5zw0
 8BX3dnHzbNHviUYX1vBgw==
X-ME-Sender: <xms:P6yEadwgIGLmdLTZFzYjRQJOhCyboUfHxc2oeaANaZcpJ6heSz2grA>
 <xme:P6yEaYF5kpO1z-_A41E_Z7SIL7zoEKRjHdReP7Sy2d9f3QP-wHzYia1OmKJT2l7Wh
 9s2PLYWhd_ZREldE3WJ6Z3I6M3gecVVIbKvRc9oK4rNhKUGcY1k1j0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeehheeiucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehlvgig
 ucghihhllhhirghmshhonhdfuceorghlvgigsehshhgriigsohhtrdhorhhgqeenucggtf
 frrghtthgvrhhnpefgleegjeehkeefkefhkeetjedugfdvtdduveehledtteeltedtveff
 ffegheelffenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhgvgiesshhhrgii
 sghothdrohhrghdpnhgspghrtghpthhtohepfeehpdhmohguvgepshhmthhpohhuthdprh
 gtphhtthhopehjohhroheskegshihtvghsrdhorhhgpdhrtghpthhtohepfhgvlhhigidr
 khhuvghhlhhinhhgsegrmhgurdgtohhmpdhrtghpthhtoheprghlvgigrghnuggvrhdrug
 gvuhgthhgvrhesrghmugdrtghomhdprhgtphhtthhopegthhhrihhsthhirghnrdhkohgv
 nhhighesrghmugdrtghomhdprhgtphhtthhopehrohgsihhnrdhmuhhrphhhhiesrghrmh
 drtghomhdprhgtphhtthhopehguhhrtghhvghtrghnshhinhhghhestghhrhhomhhiuhhm
 rdhorhhgpdhrtghpthhtohepughmihhtrhihrdhoshhiphgvnhhkohestgholhhlrggsoh
 hrrgdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthht
 oheprghirhhlihgvugesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:P6yEafGe2iZwOtoy1QIujx9JKcXQzVBHGIr7FCMNM53dR4SA7uoFPQ>
 <xmx:P6yEaeY4v6aLwSLaI-5cCVbJkfoaGXLUwMVMRnaHKWdyT5nGKisVzQ>
 <xmx:P6yEabMl_SdUrT753Jz4Iu8zYXeBk5mOIBISChHExnjKF4ONkrV_hA>
 <xmx:P6yEaXzKVHf1zwRQ33ST0VoEQ8N5wtThWPkF8uM3zAbRNMiwOEPh3w>
 <xmx:QKyEaQhAhMewyYq6yCQSoIXvkGVUwlZLw6u6ZWNTBxx4oxvqxJ3bHWjK>
Feedback-ID: i03f14258:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id A92B615C0090; Thu,  5 Feb 2026 09:42:07 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ATdnKwv6RJ4o
Date: Thu, 05 Feb 2026 07:41:11 -0700
From: "Alex Williamson" <alex@shazbot.org>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Jason Gunthorpe" <jgg@ziepe.ca>, "Leon Romanovsky" <leon@kernel.org>
Cc: "Simona Vetter" <simona@ffwll.ch>, "Jani Nikula" <jani.nikula@intel.com>, 
 "Lucas De Marchi" <lucas.demarchi@intel.com>,
 "Sumit Semwal" <sumit.semwal@linaro.org>,
 "Alex Deucher" <alexander.deucher@amd.com>,
 "David Airlie" <airlied@gmail.com>, "Gerd Hoffmann" <kraxel@redhat.com>,
 "Dmitry Osipenko" <dmitry.osipenko@collabora.com>,
 "Gurchetan Singh" <gurchetansingh@chromium.org>,
 "Chia-I Wu" <olvaffe@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Kevin Tian" <kevin.tian@intel.com>, "Joerg Roedel" <joro@8bytes.org>,
 "Will Deacon" <will@kernel.org>, "Robin Murphy" <robin.murphy@arm.com>,
 "Felix Kuehling" <Felix.Kuehling@amd.com>,
 "Ankit Agrawal" <ankita@nvidia.com>,
 "Vivek Kasireddy" <vivek.kasireddy@intel.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org
Message-Id: <1b7ee5ad-6dde-415a-8e06-93daddc9bcef@app.fastmail.com>
In-Reply-To: <f27ad57b-d935-4ffa-a65c-9f6b5d9a1f9a@amd.com>
References: <20260131-dmabuf-revoke-v7-0-463d956bd527@nvidia.com>
 <20260131-dmabuf-revoke-v7-7-463d956bd527@nvidia.com>
 <fb9bf53a-7962-451a-bac2-c61eb52c7a0f@amd.com>
 <20260204095659.5a983af2@shazbot.org>
 <ac33ad1a-330c-4ab5-bb98-4a4dedccf0da@amd.com>
 <20260205121945.GC12824@unreal> <20260205142111.GK2328995@ziepe.ca>
 <f27ad57b-d935-4ffa-a65c-9f6b5d9a1f9a@amd.com>
Subject: Re: [PATCH v7 7/8] vfio: Permit VFIO to work with pinned importers
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.30 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[shazbot.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[shazbot.org:s=fm2,messagingengine.com:s=fm3];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[shazbot.org:+,messagingengine.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[alex@shazbot.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[ffwll.ch,intel.com,linaro.org,amd.com,gmail.com,redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,suse.de,8bytes.org,arm.com,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	NEURAL_HAM(-0.00)[-0.993];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[anongit.freedesktop.org:url,shazbot.org:dkim,kaspersky.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,messagingengine.com:dkim]
X-Rspamd-Queue-Id: 28EE1F42CB
X-Rspamd-Action: no action



On Thu, Feb 5, 2026, at 7:28 AM, Christian K=C3=B6nig wrote:
> On 2/5/26 15:21, Jason Gunthorpe wrote:
>> On Thu, Feb 05, 2026 at 02:19:45PM +0200, Leon Romanovsky wrote:
>>> You don't need any backmerge, SHA-1 version of vfio-v6.19-rc8 tag is=
 the
>>> same as in Linus's tree, so the flow is:
>>=20
>> I'm confused what is the problem here?
>>=20
>> From https://anongit.freedesktop.org/git/drm/drm-misc
>>  * branch                          drm-misc-next -> FETCH_HEAD
>>=20
>> $ git show FETCH_HEAD
>> commit 779ec12c85c9e4547519e3903a371a3b26a289de
>> Author: Alexander Konyukhov <Alexander.Konyukhov@kaspersky.com>
>> Date:   Tue Feb 3 16:48:46 2026 +0300
>>=20
>>     drm/komeda: fix integer overflow in AFBC framebuffer size check
>>=20
>> $ git merge-base  FETCH_HEAD 61ceaf236115f20f4fdd7cf60f883ada1063349a
>> 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
>> $ git describe --contains 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
>> v6.19-rc6^0
>>=20
>> $ git log --oneline 61ceaf236115f20f4fdd7cf60f883ada1063349a ^FETCH_H=
EAD
>> 61ceaf236115f2 vfio: Prevent from pinned DMABUF importers to attach t=
o VFIO DMABUF
>>=20
>> Just pull Alex's tree, the drm-misc-next tree already has v6.19-rc6,
>> so all they will see is one extra patch from Alex in your PR.
>>=20
>> No need to backmerge, this is normal git stuff and there won't be
>> conflicts when they merge a later Linus tag.
>
> Correct, but that would merge the same patch through two different=20
> trees. That is usually a pretty big no-go.

Applying the patch through two different trees is a no-go, but merging t=
he same commit from a shared branch or tag is very common and acceptable=
.  It's the same commit after all, there is no conflict, no duplicate co=
mmit.  When the trees are merged, the commit will exist once in the log.=
  Thanks,

Alex
