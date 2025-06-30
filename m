Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A32BAEDFA1
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 15:53:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64BCF10E457;
	Mon, 30 Jun 2025 13:53:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="TFdlFXmb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C2410E457
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 13:53:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1751291613; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Quc7S7YVrAwr0ESwzo7PxjJiGIs42vIOTuN0aQV/CDJdC/ihdO+hi7c4CF75RkeSl++6ytGsV9jhzFW5w6J0FMKoiAUUz2medFWtszCpFGxiDYTg3QBdmJPigCj0eC03/x2SUd3NTwzV1/92K5OVCBxto66DAE0UZNFaxeJ9+kg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1751291613;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=6eT7eKw0jpds+16VHxkiEjQhzJAlIlEF8bZ6v7QhBSc=; 
 b=Q0gGkfXkPQhziMHqRLYgS8vkwj1Clqb/4V4p/rzM0V/tjSJa6Euc8eiHiDrrztjztS9Cv0B2FymhrjFO+JzBzVgW4FFn2r+mBuHDSlgs9c9pxilw2qqXaq5JS/4T39TCrqUlZxwOyqeR/nKZ9hJ9DWtwTp8wz7aIHDuXzkhyq8I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751291613; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=6eT7eKw0jpds+16VHxkiEjQhzJAlIlEF8bZ6v7QhBSc=;
 b=TFdlFXmbHUQ3czJnRygpecBzaQJlQZ6nwy6szn+waim9c4hfAeAYz+OdI5u7qtVr
 p29nD85ug+fmmOCMOOV8UF+KAoCwLrQCtB8LyEOfrc4TK0naXKneLMbxJeAB01r32CS
 QMqPKJMOS1Vp2dod74p0Ec4UEjrxr9RsnyxtdPHU=
Received: by mx.zohomail.com with SMTPS id 1751291611718437.6254643555641;
 Mon, 30 Jun 2025 06:53:31 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] Introduce Tyr
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <f0ad78da-d4ba-44ec-beda-4f8c616053f8@igalia.com>
Date: Mon, 30 Jun 2025 10:53:13 -0300
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Daniel Stone <daniels@collabora.com>,
 Rob Herring <robh@kernel.org>, Alice Ryhl <alice.ryhl@google.com>,
 Beata Michalska <beata.michalska@arm.com>,
 Carsten Haitzler <carsten.haitzler@foss.arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Ashley Smith <ashley.smith@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 kernel@collabora.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <C2A539D0-8C07-44A4-93AD-21343396D84F@collabora.com>
References: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com>
 <f0ad78da-d4ba-44ec-beda-4f8c616053f8@igalia.com>
To: =?utf-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External
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

Hi Ma=C3=ADra, thanks for chiming in :)

>=20
> To enhance readability, consider using a regmap similar to
> panthor_regs.h. This would help avoid 'magic numbers' and make the
> code's intent much clearer.


Are you referring to "struct regmap" itself? Because last I checked, =
this
abstraction is not available upstream. There was a person working on it, =
but I
guess it hasn't seen any traction for a few months. I also don't see it =
being
used in panthor_regs.h?

>=20
>> +    regs::GPU_CMD.write(iomem, irq_enable_cmd)?;
>> +
>> +    let op =3D || regs::GPU_INT_RAWSTAT.read(iomem);
>> +    let cond =3D |raw_stat: &u32| -> bool { (*raw_stat >> 8) & 1 =3D=3D=
 1 };
>> +    let res =3D io::poll::read_poll_timeout(
>> +        op,
>> +        cond,
>> +        time::Delta::from_millis(100),
>> +        Some(time::Delta::from_micros(20000)),
>> +    );
>> +
>> +    if let Err(e) =3D res {
>> +        pr_err!("GPU reset failed with errno {}\n", e.to_errno());
>> +        pr_err!(
>> +            "GPU_INT_RAWSTAT is {}\n",
>> +            regs::GPU_INT_RAWSTAT.read(iomem)?
>> +        );
>> +    }
>> +
>> +    Ok(())
>> +}
>> +
>> +kernel::of_device_table!(
>> +    OF_TABLE,
>> +    MODULE_OF_TABLE,
>> +    <TyrDriver as platform::Driver>::IdInfo,
>> +    [
>> +        (of::DeviceId::new(c_str!("rockchip,rk3588-mali")), ()),
>> +        (of::DeviceId::new(c_str!("arm,mali-valhall-csf")), ())
>> +    ]
>> +);
>> +
>> +impl platform::Driver for TyrDriver {
>> +    type IdInfo =3D ();
>> +    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> =3D =
Some(&OF_TABLE);
>> +
>> +    fn probe(
>> +        pdev: &platform::Device<Core>,
>> +        _info: Option<&Self::IdInfo>,
>> +    ) -> Result<Pin<KBox<Self>>> {
>> +        dev_dbg!(pdev.as_ref(), "Probed Tyr\n");
>> +
>> +        let core_clk =3D Clk::get(pdev.as_ref(), =
Some(c_str!("core")))?;
>> +        let stacks_clk =3D Clk::get(pdev.as_ref(), =
Some(c_str!("stacks")))?;
>=20
> Shouldn't it be OptionalClk::get? =46rom the DT schema for "arm,mali-
> valhall-csf", I see that "stacks" and "coregroups" are optional.
>=20
>> +        let coregroup_clk =3D Clk::get(pdev.as_ref(), =
Some(c_str!("coregroup")))?;
>=20
> Same.
>=20
> Best Regards,
> - Ma=C3=ADra
>=20
>=20

Ah yes, you=E2=80=99re right. I will fix that in v2.

=E2=80=94 Daniel

