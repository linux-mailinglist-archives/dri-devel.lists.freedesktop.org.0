Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A8C92B0FC
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 09:21:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C3310E1E1;
	Tue,  9 Jul 2024 07:21:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OdtXiWgU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D141510E1E1
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 07:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720509699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dW6WO+G76jLZyDSLMkWamap7ltUf9TSQdzlmmQjea1E=;
 b=OdtXiWgUv63t9cXlsIGvFb1rPvNP9C/TKUVzhwC1ow6poY9L7/z/vwcJhSYkoR6nKN635g
 miSb/HdaF2BT08E9QmLwhaBknAFGqQq1Mmh5fBYKsBJEB09nmv3O4dXZc+3LVWiy0bemmw
 Fj2yoNMqKdfTVUd8nVl3+kYaIvF0LuM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-wXCk2A_6MOeTLXOf7Cox0w-1; Tue, 09 Jul 2024 03:21:37 -0400
X-MC-Unique: wXCk2A_6MOeTLXOf7Cox0w-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-36794e8929bso541306f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 00:21:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720509696; x=1721114496;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dW6WO+G76jLZyDSLMkWamap7ltUf9TSQdzlmmQjea1E=;
 b=HYvZv25wPNV51tEwKalgJYSYoLJ/0O10cGflzkr8OB2OiZbvb3cOOkeAWizTb4iTfF
 j7m5gP16uxtVQ/5qZUxcGNm5hKUYA2HWjwe8D73rymiuQE9+m7pcdEoWSlYwqm+sILZ/
 fHXR2Dh8jAenswlJPORtKSMr9Sk6Xv9vxNU62YDjppXnX9OlnW3FPV1JnlyvLCxUzLkr
 A0fGFl0QwRmx8oeIv5pyJqVNWlqCnvXP6xS0NjvjWpRaUW14Vp9BCpcGfwy2NmPZ7QQA
 PUiIM+3rt/o/Wwcjqc7bzjLf8acu9k9zQ4TVkREspx7RUAfWAiuS/Ujew1JVpoGCF5ua
 sb2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUS+kwJKFhvm9+OvEp+i4zX8oeVN46cEe13h1uUAk89cPdvCcNKg70VZHM/i4GxY52SLT2uhC7EuwMtYfjhsLKnW1ANMvokIcTZ7nkPg9T
X-Gm-Message-State: AOJu0Ywz/78q0PJrbL46e9VURbLEnkgvgZSgrEkEF4KHRn7zNhnCKYaC
 1LDsKi1qK725OkamstA0/1JNzqNS5QSvHCsbyAzLmcjOeBXwMz4DCpJuw5cAtKabRUONtpp4dL/
 8rmXj6U5r0bqcN6tXhbMqXzRM/Nl6RrUJ+WC7HWQUTrTRsw25rLZ9FwTfh23MNCSJcQ==
X-Received: by 2002:a05:600c:358a:b0:426:5f08:542b with SMTP id
 5b1f17b1804b1-426701981aamr12098745e9.0.1720509696436; 
 Tue, 09 Jul 2024 00:21:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECRCfyILsy8xvGs+E15/2e5WJYbe8Jd+4WpmoQc8yvMhh4oUIPufkb5c0SOa/lja2miLgfRA==
X-Received: by 2002:a05:600c:358a:b0:426:5f08:542b with SMTP id
 5b1f17b1804b1-426701981aamr12098455e9.0.1720509695955; 
 Tue, 09 Jul 2024 00:21:35 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266f6f5f51sm27487855e9.25.2024.07.09.00.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 00:21:35 -0700 (PDT)
Message-ID: <7734192dbf4d07ce77ab7a20481ccb12ff71ffcb.camel@redhat.com>
Subject: Re: [PATCH v9 10/13] PCI: Give pci_intx() its own devres callback
From: Philipp Stanner <pstanner@redhat.com>
To: Ashish Kalra <Ashish.Kalra@amd.com>, Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>
Cc: airlied@gmail.com, bhelgaas@google.com, dakr@redhat.com,
 daniel@ffwll.ch,  dri-devel@lists.freedesktop.org, hdegoede@redhat.com, 
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, sam@ravnborg.org, 
 tzimmermann@suse.de, thomas.lendacky@amd.com, mario.limonciello@amd.com
Date: Tue, 09 Jul 2024 09:21:34 +0200
In-Reply-To: <20240708214656.4721-1-Ashish.Kalra@amd.com>
References: <20240613115032.29098-11-pstanner@redhat.com>
 <20240708214656.4721-1-Ashish.Kalra@amd.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

@Bjorn, @Krzysztof

On Mon, 2024-07-08 at 21:46 +0000, Ashish Kalra wrote:
> With this patch applied, we are observing unloading and then
> reloading issues with the AMD Crypto (CCP) driver:

Thank you very much for digging into this, Ashish

Could you give me some pointers how one could test CCP by himself?

>=20
> with DEVRES logging enabled, we observe the following logs:
>=20
> [=C2=A0 218.093588] ccp 0000:a2:00.1: DEVRES REL 00000000c18c52fb
> 0xffff8d09dc1972c0 devm_kzalloc_release (152 bytes)
> [=C2=A0 218.105527] ccp 0000:a2:00.1: DEVRES REL 000000003091fb95
> 0xffff8d09d3aad000 devm_kzalloc_release (3072 bytes)
> [=C2=A0 218.117500] ccp 0000:a2:00.1: DEVRES REL 0000000049e4adfe
> 0xffff8d09d588f000 pcim_intx_restore (4 bytes)
> [=C2=A0 218.129519] ccp 0000:a2:00.1: DEVRES ADD 000000001a2ac6ad
> 0xffff8cfa867b7cc0 pcim_intx_restore (4 bytes)
> [=C2=A0 218.140434] ccp 0000:a2:00.1: DEVRES REL 00000000627ecaf7
> 0xffff8d09d588f680 pcim_msi_release (16 bytes)
> [=C2=A0 218.151665] ccp 0000:a2:00.1: DEVRES REL 0000000058b2252a
> 0xffff8d09dc199680 msi_device_data_release (80 bytes)
> [=C2=A0 218.163625] ccp 0000:a2:00.1: DEVRES REL 00000000435cc85e
> 0xffff8d09d588ff80 devm_attr_group_remove (8 bytes)
> [=C2=A0 218.175224] ccp 0000:a2:00.1: DEVRES REL 00000000cb6fcd9b
> 0xffff8d09eb583660 pcim_addr_resource_release (40 bytes)
> [=C2=A0 218.187319] ccp 0000:a2:00.1: DEVRES REL 00000000d64a8b84
> 0xffff8d09eb583180 pcim_iomap_release (48 bytes)
> [=C2=A0 218.198615] ccp 0000:a2:00.1: DEVRES REL 0000000099ac6b28
> 0xffff8d09eb5830c0 pcim_addr_resource_release (40 bytes)
> [=C2=A0 218.210730] ccp 0000:a2:00.1: DEVRES REL 00000000bdd27f88
> 0xffff8d09d3ac2700 pcim_release (0 bytes)
> [=C2=A0 218.221489] ccp 0000:a2:00.1: DEVRES REL 00000000e763315c
> 0xffff8d09d3ac2240 devm_kzalloc_release (20 bytes)
> [=C2=A0 218.233008] ccp 0000:a2:00.1: DEVRES REL 00000000ae90f983
> 0xffff8d09dc25a800 devm_kzalloc_release (184 bytes)
> [=C2=A0 218.245251] ccp 0000:23:00.1: DEVRES REL 00000000a2ec0085
> 0xffff8cfa86bee700 fw_name_devm_release (16 bytes)
> [=C2=A0 218.256748] ccp 0000:23:00.1: DEVRES REL 0000000021bccd98
> 0xffff8cfaa528d5c0 devm_pages_release (16 bytes)
> [=C2=A0 218.268044] ccp 0000:23:00.1: DEVRES REL 000000003ef7cbc7
> 0xffff8cfaa1b5ec00 devm_kzalloc_release (104 bytes)
> [=C2=A0 218.279631] ccp 0000:23:00.1: DEVRES REL 00000000619322e1
> 0xffff8cfaa1b5e480 devm_kzalloc_release (152 bytes)
> [=C2=A0 218.300438] ccp 0000:23:00.1: DEVRES REL 00000000c261523b
> 0xffff8cfaad88b000 devm_kzalloc_release (3072 bytes)
> [=C2=A0 218.331000] ccp 0000:23:00.1: DEVRES REL 00000000fbd19618
> 0xffff8cfaa528d140 pcim_intx_restore (4 bytes)
> [=C2=A0 218.361330] ccp 0000:23:00.1: DEVRES ADD 0000000057f8e767
> 0xffff8cfa867b7740 pcim_intx_restore (4 bytes)
> [=C2=A0 218.391226] ccp 0000:23:00.1: DEVRES REL 0000000058c9dce1
> 0xffff8cfaa528d880 pcim_msi_release (16 bytes)
> [=C2=A0 218.421340] ccp 0000:23:00.1: DEVRES REL 00000000c8ab08a7
> 0xffff8cfa9e617300 msi_device_data_release (80 bytes)
> [=C2=A0 218.452357] ccp 0000:23:00.1: DEVRES REL 00000000cf5baccb
> 0xffff8cfaa528d8c0 devm_attr_group_remove (8 bytes)
> [=C2=A0 218.483011] ccp 0000:23:00.1: DEVRES REL 00000000b8cbbadd
> 0xffff8cfa9c596060 pcim_addr_resource_release (40 bytes)
> [=C2=A0 218.514343] ccp 0000:23:00.1: DEVRES REL 00000000920f9607
> 0xffff8cfa9c596c60 pcim_iomap_release (48 bytes)
> [=C2=A0 218.544659] ccp 0000:23:00.1: DEVRES REL 00000000d401a708
> 0xffff8cfa9c596840 pcim_addr_resource_release (40 bytes)
> [=C2=A0 218.575774] ccp 0000:23:00.1: DEVRES REL 00000000865d2fa2
> 0xffff8cfaa528d940 pcim_release (0 bytes)
> [=C2=A0 218.605758] ccp 0000:23:00.1: DEVRES REL 00000000f5b79222
> 0xffff8cfaa528d080 devm_kzalloc_release (20 bytes)
> [=C2=A0 218.636260] ccp 0000:23:00.1: DEVRES REL 0000000037ef240a
> 0xffff8cfa9eeb3f00 devm_kzalloc_release (184 bytes)
>=20
> and the CCP driver reload issue during driver probe:
>=20
> [=C2=A0 226.552684] pci 0000:23:00.1: Resources present before probing
> [=C2=A0 226.568846] pci 0000:a2:00.1: Resources present before probing
>=20
> From the above DEVRES logging, it looks like pcim_intx_restore
> associated resource is being released but then
> being re-added during detach/unload, which causes really_probe() to
> fail at probe time, as dev->devres_head is
> not empty due to this added resource:
> ...
> [=C2=A0 218.331000] ccp 0000:23:00.1: DEVRES REL 00000000fbd19618
> 0xffff8cfaa528d140 pcim_intx_restore (4 bytes)
> [=C2=A0 218.361330] ccp 0000:23:00.1: DEVRES ADD 0000000057f8e767
> 0xffff8cfa867b7740 pcim_intx_restore (4 bytes)
> ...
>=20
> Going more deep into this:=20
>=20
> This is the initial pcim_intx_resoure associated resource being added
> during first (CCP) driver load:
>=20
> [=C2=A0=C2=A0 40.418933]=C2=A0 pcim_intx+0x3a/0x120
> [=C2=A0=C2=A0 40.418936]=C2=A0 pci_intx+0x8b/0xa0
> [=C2=A0=C2=A0 40.418939]=C2=A0 __pci_enable_msix_range+0x369/0x530
> [=C2=A0=C2=A0 40.418943]=C2=A0 pci_enable_msix_range+0x18/0x20
> [=C2=A0=C2=A0 40.418946]=C2=A0 sp_pci_probe+0x106/0x310 [ccp]
> [=C2=A0=C2=A0 40.418965] ipmi device interface
> [=C2=A0=C2=A0 40.418960]=C2=A0 ? srso_alias_return_thunk+0x5/0xfbef5
> [=C2=A0=C2=A0 40.418969]=C2=A0 local_pci_probe+0x4f/0xb0
> [=C2=A0=C2=A0 40.418973]=C2=A0 work_for_cpu_fn+0x1e/0x30
> [=C2=A0=C2=A0 40.418976]=C2=A0 process_one_work+0x183/0x350
> [=C2=A0=C2=A0 40.418980]=C2=A0 worker_thread+0x2df/0x3f0
> [=C2=A0=C2=A0 40.418982]=C2=A0 ? __pfx_worker_thread+0x10/0x10
> [=C2=A0=C2=A0 40.418985]=C2=A0 kthread+0xd0/0x100
> [=C2=A0=C2=A0 40.418987]=C2=A0 ? __pfx_kthread+0x10/0x10
> [=C2=A0=C2=A0 40.418990]=C2=A0 ret_from_fork+0x40/0x60
> [=C2=A0=C2=A0 40.418993]=C2=A0 ? __pfx_kthread+0x10/0x10
> [=C2=A0=C2=A0 40.418996]=C2=A0 ret_from_fork_asm+0x1a/0x30
> [=C2=A0=C2=A0 40.419001]=C2=A0 </TASK>
> ..
> ..
> [=C2=A0=C2=A0 40.419012] ccp 0000:23:00.1: DEVRES ADD 00000000fbd19618
> 0xffff8cfaa528d140 pcim_intx_restore (4 bytes)
>=20
> Now, at driver unload:=20
> devres_release_all() -> remove_nodes() -> release_nodes() ...
>=20
> remove_nodes() moves normal devres entries to the todo list, as can
> be seen with the following log:
> ...
> [=C2=A0 218.245241] moving node 00000000fbd19618 0xffff8cfaa528d140 from
> devres to todo list
> ...
>=20
> So, now this pcim_intx_resource associated resource is no longer part
> of dev->devres_head list and has been
> moved to the todo list.
>=20
> Later, when release_nodes() is invoked, it calls the associated
> release() callback associated with this devres:
> ...
> [=C2=A0 218.331000] ccp 0000:23:00.1: DEVRES REL 00000000fbd19618
> 0xffff8cfaa528d140 pcim_intx_restore (4 bytes)
> ...
>=20
> The call flow for that is:
> pcim_intx_restore() -> pci_intx() -> pcim_intx() ...
>=20
> Now, pcim_intx() calls get_or_create_intx_devres() which tries to
> find it's associated devres using devres_find(), but=20
> that fails to find the devres, as the devres is no longer on dev-
> >devres_head and has been moved to todo list.
>=20
> Therefore, get_or_create_intx_devres() adds a new devres at driver
> unload/detach time:
> ...
> [=C2=A0 218.361330] ccp 0000:23:00.1: DEVRES ADD 0000000057f8e767
> 0xffff8cfa867b7740 pcim_intx_restore (4 bytes)
> ...

You're absolutely right, that seems to be the issue precisely. In fact,
this problem of PCI hybrid functions calling themselves again even
forced me to implement a "pure unmanaged" version of
__pci_request_region(). So it's a pity that I didn't think of that
problem for pci_intx().

>=20
> But, then this is an issue as pcim_intx() is supposed to restore the
> original PCI INTx state on driver detach, but it now
> operating on a newly added devres and not the original devres (added
> at driver probe) which contains the original PCI INTx
> state, so it will be restoring an incorrect PCI INTx state ?

I think this is just UB and we don't have to think about whether it's
the correct state or not =E2=80=93 it must only be restored once, so it's
broken in any case.

>=20
> Additionally, this newly added devres causes driver reload/probe
> failure as really_probe() now finds resources present
> before probing.

Yes, that has to be separated.

@Bjorn:
So I think the solution will be not to call into pci_intx() from
pcim_intx_restore() at all anymore.

Similar as we do with __pci_request_region() <-> __pcim_request_region().

Let me dig into that..

I guess you'll prefer me to send a fixup commit to squash into the
pcim_intx() commit?

I'm quite busy today, but will definitely deliver that quite soon.

>=20
> Not sure, if this issue has been observed with other PCI device
> drivers.

Everyone using pci_intx() AND pcim_enable_device() will have this
issue.

The only thing I'm wondering about is where your code in
drivers/crypto/ccp/ calls into pci_intx()?


Regards,
P.

>=20
> Thanks,
> Ashish
>=20

