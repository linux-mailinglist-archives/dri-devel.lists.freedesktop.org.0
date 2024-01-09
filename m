Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D998283E1
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 11:22:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA87D10E3D8;
	Tue,  9 Jan 2024 10:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB1010E3D8
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 10:22:01 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3C33540E0196; 
 Tue,  9 Jan 2024 10:21:58 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id n29gUFQZ12Kl; Tue,  9 Jan 2024 10:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1704795715; bh=xjuqUo1N9un7QD2OXvyR+5fIfImqWhSyt6kzFoGIsSI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C6+AM1CUovm2+HNjxZyX+e4EIKEIps6SduVpK8vGtpGYTqJPSLpmUesTeMBRYtC/l
 ncstqX3pXn8srWdzIdVsdEKq8ooWFHdCSaJvj1AQAGPytLN1msAn3y+y1MgL6Djb5m
 lBtxP1+/M5nS1WhPCIIc6T23ro5CTW9UHQCw4UwRS+sCzB2HzY9oobVxcH93eT4ZY1
 qxlNQqdozYylfVrn9n+ZK6sNc/Yw0iTaKOmklZ/lOA3zc1ywZB0lvPNy8Rz5WOKViX
 qeG7s/66rfaIrNP9qJdAk2eIOWYE62hpFVxD0YKsKiq+wpEY7Fnzu59mFxY/JQbI0F
 IkV5PllliIvA+/lAhfJgDqXjpbkRSWGjJSz+v4UhymUp4gHatNfK3VmRRLR5xBYJ/b
 Gr0UXBYuwxvokdHt7ta0E7Kd0RHMW8VGUe3Nkc9ZgwU4KzpOXS+zfNGsR3HSvC5x+z
 TNaIuhT76gqu8sXGV4OzVoA2faEwSbMK12i5lb9BHwZH5If8QWiMSF6V7gcZLZlvOL
 nNx7pex887OQ3TJO7erJ3ljOVbRVnAKtWgsdYUBebxYgE9lul/RU7WYc2Nk1YboaXc
 aMFr95IfvEdRMlN0UaeDskrX02L0lJlG5QGnS9BTd8Gi6dtM8hPzlY5Q/Sk5OZ2RrG
 kJcYCWFSUzab6KPrW90pG7EM=
Received: from zn.tnic (pd9530f8c.dip0.t-ipconnect.de [217.83.15.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 68D2740E016C;
 Tue,  9 Jan 2024 10:21:28 +0000 (UTC)
Date: Tue, 9 Jan 2024 11:21:21 +0100
From: Borislav Petkov <bp@alien8.de>
To: Alexey Makhalov <alexey.makhalov@broadcom.com>
Subject: Re: [PATCH v6 0/7] VMware hypercalls enhancements
Message-ID: <20240109102121.GAZZ0eIZXV03k52jDX@fat_crate.local>
References: <20240109084052.58661-1-amakhalov@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240109084052.58661-1-amakhalov@vmware.com>
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
Cc: pv-drivers@vmware.com, dave.hansen@linux.intel.com,
 dri-devel@lists.freedesktop.org, namit@vmware.com, hpa@zytor.com,
 timothym@vmware.com, x86@kernel.org, mingo@redhat.com,
 linux-graphics-maintainer@vmware.com, linux-input@vger.kernel.org,
 tzimmermann@suse.de, richardcochran@gmail.com, virtualization@lists.linux.dev,
 mripard@kernel.org, akaher@vmware.com, jsipek@vmware.com, tglx@linutronix.de,
 netdev@vger.kernel.org, dmitry.torokhov@gmail.com,
 linux-kernel@vger.kernel.org, horms@kernel.org,
 kirill.shutemov@linux.intel.com, zackr@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 09, 2024 at 12:40:45AM -0800, Alexey Makhalov wrote:
> v5->v6 change:
> - Added ack by Kirill A. Shutemov in patch 7.

Please do not spam. Adding someone's Ack does not mean you have to
resend the whole thing immediately again.

While waiting, please read Documentation/process/submitting-patches.rst

and especially:

"Don't get discouraged - or impatient
------------------------------------

After you have submitted your change, be patient and wait.  Reviewers are
busy people and may not get to your patch right away.

Once upon a time, patches used to disappear into the void without comment,
but the development process works more smoothly than that now.  You should
receive comments within a few weeks (typically 2-3); if that does not
happen, make sure that you have sent your patches to the right place.
Wait for a minimum of one week before resubmitting or pinging reviewers
- possibly longer during busy times like merge windows."

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
