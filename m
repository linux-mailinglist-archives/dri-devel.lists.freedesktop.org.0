Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82328C86A66
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 19:34:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A9DE10E40E;
	Tue, 25 Nov 2025 18:34:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=shazbot.org header.i=@shazbot.org header.b="qdqbeodx";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="VDYg48Yq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-b3-smtp.messagingengine.com
 (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F032610E439
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 18:34:08 +0000 (UTC)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
 by mailfout.stl.internal (Postfix) with ESMTP id A2D041D000C7;
 Tue, 25 Nov 2025 13:34:07 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-10.internal (MEProxy); Tue, 25 Nov 2025 13:34:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1764095647;
 x=1764182047; bh=F0IpR5aPqfm9XY0htrmR71S0FnmwAcLKnqO8oA47JqI=; b=
 qdqbeodxTOuavSU8Jmqwf5n2cwtZRx0EolpcdTsqZ+Dj3oaOMjHME/tUbsBFLmOH
 tMuDEabcZ9+Mr/tXBWZ2k6AplvoGDne5QmEbujdLErq69NVhydjBfnf7dMEuTlCG
 1sNq6gMYq2YmnWcd1b7Op2QKazMBH6lJpWOF1up6WeVhDpRbcrTTylSXKp6wtcVC
 Ri3s+ZnOb86Quoz0N1IT6cy6CeBhYeDUVt8F8YsYcx2W7Bz9TFaKJ0FjFqNnqRcD
 11H9Lkx5d5gKeHz8VW4NeKXYqyqUlpn71lT143s8sXPbEDlAUcaVCC4ipkWCDdWV
 XqBdQ5E3xZOz8guCervEPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1764095647; x=
 1764182047; bh=F0IpR5aPqfm9XY0htrmR71S0FnmwAcLKnqO8oA47JqI=; b=V
 DYg48YqVwRHFzlSubi8599r21bBXbSlPtP4K3oM6CQ3tCqAAfAclBBToBFOSCDwr
 IeVO2aCmMajpUV1uzOQwyzcdrZs/YCMIZKi9Qr7CwKpFIXs11T3v2y1xnrRecPzA
 6okyXuzSBrs3cpUOay2Q+cL2+H6eAjbEi/PvKr9URDpti81Q8+Fe3t5JXNgrtiSq
 YrwJOXKYGPHvxLGNGkNNAMeunL3xOOt1fReRC27/SCCe0bawU7cIbOsLWwLLRQWx
 Mg0QPA8HBP9xyfr4GZHgbLYOXLYGTm9tChbucp787LQLBvI+ncKCtmw5ug35DJFy
 ZPYAAFuXmIhZ6AmX6L9yg==
X-ME-Sender: <xms:nfYlaZo-gZTh4gwsS2aDSHRANAa_7ju7OyG4WnMrpq3D7r450n4iPw>
 <xme:nfYlacHKqrYkf8__FPxCgGC49TEMc3WGfKmjKoCLzx8lYsdxHkU1ZP9jZ8zFaVuHd
 _xVMNKZ75LjFVW13EGAxtI2lIG_ogECM1ivWLgSpeiuIt05NhFT2A>
X-ME-Received: <xmr:nfYlabr9i1X879ob9vAc5kK0hI2mi3w2rd_W1cyL2lAcu2a6I5o9MN91>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvgedvvddtucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepfffhvfevuffkjghfgggtgfesthhqredttddtjeenucfhrhhomheptehlvgigucgh
 ihhllhhirghmshhonhcuoegrlhgvgiesshhhrgiisghothdrohhrgheqnecuggftrfgrth
 htvghrnhepgfffvdefjeejueevfeetudfhgeetfeeuheetfeekjedvuddvueehffdtgeej
 keetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hlvgigsehshhgriigsohhtrdhorhhgpdhnsggprhgtphhtthhopedvuddpmhhouggvpehs
 mhhtphhouhhtpdhrtghpthhtohepmhhitghhrghlrdifihhnihgrrhhskhhisehinhhtvg
 hlrdgtohhmpdhrtghpthhtoheplhhutggrshdruggvmhgrrhgthhhisehinhhtvghlrdgt
 ohhmpdhrtghpthhtohepthhhohhmrghsrdhhvghllhhsthhrohhmsehlihhnuhigrdhinh
 htvghlrdgtohhmpdhrtghpthhtoheprhhoughrihhgohdrvhhivhhisehinhhtvghlrdgt
 ohhmpdhrtghpthhtohepjhhgghesiihivghpvgdrtggrpdhrtghpthhtohephihishhhrg
 hihhesnhhvihguihgrrdgtohhmpdhrtghpthhtohepkhgvvhhinhdrthhirghnsehinhht
 vghlrdgtohhmpdhrtghpthhtohepshhkohhlohhthhhumhhthhhosehnvhhiughirgdrtg
 homhdprhgtphhtthhopehinhhtvghlqdigvgeslhhishhtshdrfhhrvggvuggvshhkthho
 phdrohhrgh
X-ME-Proxy: <xmx:nvYlaS17QHxWmPJfwG3GI4otHdxfVK45lWsmw0C1EF_ai99eLE7vZg>
 <xmx:nvYlactYUmFrCy9ixqF9eTfgFczsWp0Vv0axKg_zkHZKHP56Jdy7mQ>
 <xmx:nvYlabE3w2ZoxLYJVuoqWIyKYIHX5rbL17QJ28gj_b5qhLPPXv90qA>
 <xmx:nvYlab2hFWHz6PzERaojxHt1Q5xavebxe1jl9OCLNl6c_i2OkKGo_Q>
 <xmx:n_YlaVMX-31Inoy7Aph39z3kZDgY-7RQ058c1WwQ6FRef_8L84ePzuBo>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Nov 2025 13:34:04 -0500 (EST)
Date: Tue, 25 Nov 2025 11:34:03 -0700
From: Alex Williamson <alex@shazbot.org>
To: =?UTF-8?B?TWljaGHFgg==?= Winiarski <michal.winiarski@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas
 <yishaih@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, Shameer Kolothum
 <skolothumtho@nvidia.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, "Michal Wajdeczko" <michal.wajdeczko@intel.com>,
 <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v6 3/4] drm/xe/pf: Export helpers for VFIO
Message-ID: <20251125113403.6156f03a.alex@shazbot.org>
In-Reply-To: <20251124230841.613894-4-michal.winiarski@intel.com>
References: <20251124230841.613894-1-michal.winiarski@intel.com>
 <20251124230841.613894-4-michal.winiarski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Tue, 25 Nov 2025 00:08:40 +0100
Micha=C5=82 Winiarski <michal.winiarski@intel.com> wrote:
> +/**
> + * xe_sriov_vfio_wait_flr_done() - Wait for VF FLR completion.
> + * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
> + * @vfid: the VF identifier (can't be 0)
> + *
> + * This function will wait until VF FLR is processed by PF on all tiles =
(or
> + * until timeout occurs).
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_vfio_wait_flr_done(struct xe_device *xe, unsigned int vfid)
> +{
> +	if (!IS_SRIOV_PF(xe))
> +		return -EPERM;
> +	if (vfid =3D=3D PFID || vfid > xe_sriov_pf_num_vfs(xe))
> +		return -EINVAL;
> +
> +	guard(xe_pm_runtime_noresume)(xe);
> +
> +	return xe_sriov_pf_control_wait_flr(xe, vfid);
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_wait_flr_done, "xe-vfio-pci");
> +
> +/**
> + * xe_sriov_vfio_suspend_device() - Suspend VF.
> + * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
> + * @vfid: the VF identifier (can't be 0)
> + *
> + * This function will pause VF on all tiles/GTs.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_vfio_suspend_device(struct xe_device *xe, unsigned int vfid)
> +{
> +	if (!IS_SRIOV_PF(xe))
> +		return -EPERM;
> +	if (vfid =3D=3D PFID || vfid > xe_sriov_pf_num_vfs(xe))
> +		return -EINVAL;
> +
> +	guard(xe_pm_runtime_noresume)(xe);
> +
> +	return xe_sriov_pf_control_pause_vf(xe, vfid);
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_suspend_device, "xe-vfio-pci");
> +
> +/**
> + * xe_sriov_vfio_resume_device() - Resume VF.
> + * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
> + * @vfid: the VF identifier (can't be 0)
> + *
> + * This function will resume VF on all tiles.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_vfio_resume_device(struct xe_device *xe, unsigned int vfid)
> +{
> +	if (!IS_SRIOV_PF(xe))
> +		return -EPERM;
> +	if (vfid =3D=3D PFID || vfid > xe_sriov_pf_num_vfs(xe))
> +		return -EINVAL;
> +
> +	guard(xe_pm_runtime_noresume)(xe);
> +
> +	return xe_sriov_pf_control_resume_vf(xe, vfid);
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_resume_device, "xe-vfio-pci");
> +
> +/**
> + * xe_sriov_vfio_stop_copy_enter() - Initiate a VF device migration data=
 save.
> + * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
> + * @vfid: the VF identifier (can't be 0)
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_vfio_stop_copy_enter(struct xe_device *xe, unsigned int vfi=
d)
> +{
> +	if (!IS_SRIOV_PF(xe))
> +		return -EPERM;
> +	if (vfid =3D=3D PFID || vfid > xe_sriov_pf_num_vfs(xe))
> +		return -EINVAL;
> +
> +	guard(xe_pm_runtime_noresume)(xe);
> +
> +	return xe_sriov_pf_control_trigger_save_vf(xe, vfid);
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop_copy_enter, "xe-vfio-pci");
> +
> +/**
> + * xe_sriov_vfio_stop_copy_exit() - Finish a VF device migration data sa=
ve.
> + * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
> + * @vfid: the VF identifier (can't be 0)
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_vfio_stop_copy_exit(struct xe_device *xe, unsigned int vfid)
> +{
> +	if (!IS_SRIOV_PF(xe))
> +		return -EPERM;
> +	if (vfid =3D=3D PFID || vfid > xe_sriov_pf_num_vfs(xe))
> +		return -EINVAL;
> +
> +	guard(xe_pm_runtime_noresume)(xe);
> +
> +	return xe_sriov_pf_control_finish_save_vf(xe, vfid);
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop_copy_exit, "xe-vfio-pci");
> +
> +/**
> + * xe_sriov_vfio_resume_data_enter() - Initiate a VF device migration da=
ta restore.
> + * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
> + * @vfid: the VF identifier (can't be 0)
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_vfio_resume_data_enter(struct xe_device *xe, unsigned int v=
fid)
> +{
> +	if (!IS_SRIOV_PF(xe))
> +		return -EPERM;
> +	if (vfid =3D=3D PFID || vfid > xe_sriov_pf_num_vfs(xe))
> +		return -EINVAL;
> +
> +	guard(xe_pm_runtime_noresume)(xe);
> +
> +	return xe_sriov_pf_control_trigger_restore_vf(xe, vfid);
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_resume_data_enter, "xe-vfio-pci"=
);
> +
> +/**
> + * xe_sriov_vfio_resume_data_exit() - Finish a VF device migration data =
restore.
> + * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
> + * @vfid: the VF identifier (can't be 0)
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_vfio_resume_data_exit(struct xe_device *xe, unsigned int vf=
id)
> +{
> +	if (!IS_SRIOV_PF(xe))
> +		return -EPERM;
> +	if (vfid =3D=3D PFID || vfid > xe_sriov_pf_num_vfs(xe))
> +		return -EINVAL;
> +
> +	guard(xe_pm_runtime_noresume)(xe);
> +
> +	return xe_sriov_pf_control_finish_restore_vf(xe, vfid);
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_resume_data_exit, "xe-vfio-pci");
> +
> +/**
> + * xe_sriov_vfio_error() - Move VF device to error state.
> + * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
> + * @vfid: the VF identifier (can't be 0)
> + *
> + * Reset is needed to move it out of error state.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_vfio_error(struct xe_device *xe, unsigned int vfid)
> +{
> +	if (!IS_SRIOV_PF(xe))
> +		return -EPERM;
> +	if (vfid =3D=3D PFID || vfid > xe_sriov_pf_num_vfs(xe))
> +		return -EINVAL;
> +
> +	guard(xe_pm_runtime_noresume)(xe);
> +
> +	return xe_sriov_pf_control_stop_vf(xe, vfid);
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_error, "xe-vfio-pci");
> +
> +/**
> + * xe_sriov_vfio_data_read() - Read migration data from the VF device.
> + * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
> + * @vfid: the VF identifier (can't be 0)
> + * @buf: start address of userspace buffer
> + * @len: requested read size from userspace
> + *
> + * Return: number of bytes that has been successfully read,
> + *	   0 if no more migration data is available, -errno on failure.
> + */
> +ssize_t xe_sriov_vfio_data_read(struct xe_device *xe, unsigned int vfid,
> +				char __user *buf, size_t len)
> +{
> +	if (!IS_SRIOV_PF(xe))
> +		return -EPERM;
> +	if (vfid =3D=3D PFID || vfid > xe_sriov_pf_num_vfs(xe))
> +		return -EINVAL;
> +
> +	guard(xe_pm_runtime_noresume)(xe);
> +
> +	return xe_sriov_pf_migration_read(xe, vfid, buf, len);
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_data_read, "xe-vfio-pci");
> +
> +/**
> + * xe_sriov_vfio_data_write() - Write migration data to the VF device.
> + * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
> + * @vfid: the VF identifier (can't be 0)
> + * @buf: start address of userspace buffer
> + * @len: requested write size from userspace
> + *
> + * Return: number of bytes that has been successfully written, -errno on=
 failure.
> + */
> +ssize_t xe_sriov_vfio_data_write(struct xe_device *xe, unsigned int vfid,
> +				 const char __user *buf, size_t len)
> +{
> +	if (!IS_SRIOV_PF(xe))
> +		return -EPERM;
> +	if (vfid =3D=3D PFID || vfid > xe_sriov_pf_num_vfs(xe))
> +		return -EINVAL;
> +
> +	guard(xe_pm_runtime_noresume)(xe);
> +
> +	return xe_sriov_pf_migration_write(xe, vfid, buf, len);
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_data_write, "xe-vfio-pci");
> +
> +/**
> + * xe_sriov_vfio_stop_copy_size() - Get a size estimate of VF device mig=
ration data.
> + * @xe: the PF &xe_device obtained by calling xe_sriov_vfio_get_pf()
> + * @vfid: the VF identifier (can't be 0)
> + *
> + * Return: migration data size in bytes or a negative error code on fail=
ure.
> + */
> +ssize_t xe_sriov_vfio_stop_copy_size(struct xe_device *xe, unsigned int =
vfid)
> +{
> +	if (!IS_SRIOV_PF(xe))
> +		return -EPERM;
> +	if (vfid =3D=3D PFID || vfid > xe_sriov_pf_num_vfs(xe))
> +		return -EINVAL;
> +
> +	guard(xe_pm_runtime_noresume)(xe);
> +
> +	return xe_sriov_pf_migration_size(xe, vfid);
> +}
> +EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_stop_copy_size, "xe-vfio-pci");

The duplicated testing and identical structure of most of the above
functions suggests a helper, if not full on definition by macro.
Thanks,

Alex
