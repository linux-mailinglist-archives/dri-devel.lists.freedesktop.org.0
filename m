Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HP+GEg5q2nZbAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 21:30:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4250227824
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 21:29:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC8910E3F2;
	Fri,  6 Mar 2026 20:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DT6udhdE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E9A10E3F2
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 20:29:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 01BA36001D;
 Fri,  6 Mar 2026 20:29:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF436C4CEF7;
 Fri,  6 Mar 2026 20:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772828994;
 bh=nw+Pw4hNc3wnNMmLgdRw5pKtliePPxGsNsPNNNI9154=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=DT6udhdEfjFSJxbNZYMAAaFgjgq3iUadKJFHSNKvvhKJWKINFRqT1IkW0ayW/C8Wc
 SPg3iD1/qh7c9V13lHrdPkWvhN1RkDfnb1YM7kG4vpZerf+PXFkHH/3eIp3VwGQJVZ
 zJTiADESMMXyeriapiK0pPNYhM357332X6ZY0PYAphipf4I166qSGrtcMtuLSa2Jr4
 nint6XA//f6aHfCNIGyxZ9bzleDsKNHtiHUlrpTL9IrwkSfK4qrKWbm63KZO2AxESG
 +Levw1Hpq/GURssTb4/M/iK1pNPZQVQDXcwPCEOwkSNmetrym8lyXWSOOMrXA15WcQ
 OURpb62mjXZgA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 21:29:47 +0100
Message-Id: <DGVZFDLUCD1K.2L6EG0GJ4LWX7@kernel.org>
Subject: Re: [PATCH v2 2/4] serdev: add private data to serdev_device
Cc: "Rob Herring" <robh@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Jiri Slaby" <jirislaby@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Kari
 Argillander" <kari.argillander@gmail.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Viresh Kumar" <viresh.kumar@linaro.org>, "Boqun Feng"
 <boqun@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, <linux-serial@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>
To: "Markus Probst" <markus.probst@posteo.de>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260306-rust_serdev-v2-0-e9b23b42b255@posteo.de>
 <20260306-rust_serdev-v2-2-e9b23b42b255@posteo.de>
In-Reply-To: <20260306-rust_serdev-v2-2-e9b23b42b255@posteo.de>
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
X-Rspamd-Queue-Id: C4250227824
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:ojeda@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:kari.argillander@gmail.com,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:boqun@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-serial@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,m:markus.probst@posteo.de,m:kariargillander@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,linaro.org,ffwll.ch,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:email]
X-Rspamd-Action: no action

On Fri Mar 6, 2026 at 8:35 PM CET, Markus Probst wrote:
> Add private data to `struct serdev_device`, as it is required by the
> rust abstraction added in the following commit
> (rust: add basic serial device bus abstractions).
>
> Signed-off-by: Markus Probst <markus.probst@posteo.de>
> ---
>  include/linux/serdev.h | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/include/linux/serdev.h b/include/linux/serdev.h
> index 5654c58eb73c..b591af23faf0 100644
> --- a/include/linux/serdev.h
> +++ b/include/linux/serdev.h
> @@ -33,12 +33,13 @@ struct serdev_device_ops {
> =20
>  /**
>   * struct serdev_device - Basic representation of an serdev device
> - * @dev:	Driver model representation of the device.
> - * @nr:		Device number on serdev bus.
> - * @ctrl:	serdev controller managing this device.
> - * @ops:	Device operations.
> - * @write_comp	Completion used by serdev_device_write() internally
> - * @write_lock	Lock to serialize access when writing data
> + * @dev:	 Driver model representation of the device.
> + * @nr:		 Device number on serdev bus.
> + * @ctrl:	 serdev controller managing this device.
> + * @ops:	 Device operations.
> + * @write_comp	 Completion used by serdev_device_write() internally
> + * @write_lock	 Lock to serialize access when writing data
> + * @private_data Private data for the device driver.

I think this is a bit misleading, as the driver's device private data is st=
ored
in the embedded struct device. This seems to be more about having a place t=
o
store private data of the Rust abstraction.

So, you may want to name this something along the lines of rust_private_dat=
a.
Additionally, you should make it very clear that this field must not be use=
d by
drivers directly (i.e. C drivers could easily be tempted to abuse this).

>   */
>  struct serdev_device {
>  	struct device dev;
> @@ -47,6 +48,7 @@ struct serdev_device {
>  	const struct serdev_device_ops *ops;
>  	struct completion write_comp;
>  	struct mutex write_lock;
> +	void *private_data;
>  };
> =20
>  static inline struct serdev_device *to_serdev_device(struct device *d)
>
> --=20
> 2.52.0

