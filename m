Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IJPCiYnnGlzAAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 11:08:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9828F174921
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 11:08:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE8EA10E2CF;
	Mon, 23 Feb 2026 10:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Ko5he2OL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com
 [209.85.208.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5866B10E2CF
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 10:08:35 +0000 (UTC)
Received: by mail-ed1-f74.google.com with SMTP id
 4fb4d7f45d1cf-6581a45f30eso3790263a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 02:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1771841314; x=1772446114;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=wlxVSXIBEWmbvlrro6jhFkd5VzymdyQh6rt270iLHWc=;
 b=Ko5he2OLaJK2YBMXt4FwzAlRSEGGFHCbIkIA2C4wBdWVAn1sqlzdz2Z/3cxL+YyAUm
 fayoDldJUvLqEXXjJRrEjdGyrTPA+eZxJCOiRAG7J07GS1GOadw2REo+oG4HscDvCyjL
 FBgdPPQRQlkR5mjTah+1AqaMCpTf1SFyXSvIl2bRk/IAUNwQkgYfsN9vTdQv2+0fxs71
 MaCXK81uWGtSoBavZTQVg4k7LdiwUJWNBZdye6rG/Jpdrb3Pyfz52oZZQL8bLxLJI9gm
 JuXttMHmKtUy7mOvy9qDqcFgV9qwZqsRHEDYCkC2G4p8ka9BdArnfPV7EXn5xKtPhQtf
 bikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771841314; x=1772446114;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wlxVSXIBEWmbvlrro6jhFkd5VzymdyQh6rt270iLHWc=;
 b=uoNAgH1D3hRaTSZCeAOUJ7Z75UMF0/2+CC68jYgKTKjOC/YvgoUd0UJHjKPAc89S5+
 sarADDezuF1JrTJMvlWrY4/r3l/Zu33xXdNgJebZsr6/na3JlJ+ALDi2/6c9qtFeC2Oi
 Twou6/GOBqH9CYmUUZJVkJDOh7Wa2fVvj00n4L/tmZwWNyoG+4gARxIa8SBOlDdTtD9+
 e+guF67rl2Ama7uzpgge/Eo6mUnz6BK5WAbkr1RXowdoRdEvJQsGLvHm0UoF83L2MeKR
 3qxd3nSwhFAsK1EQ0D0BF05Orewm6Eh9//A4aaITCXCk120+z7oT+5xI+zdQX8p2wR7s
 Caog==
X-Forwarded-Encrypted: i=1;
 AJvYcCVG+Lbi3EUDMf+v2p1pVjf6UjR4NjGwJv8eoK4lJWLAKYuSGHAbvl9VEWYtLqmlQthCDE+K6glw9X8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjU635qolVKDv4T1+KyBcmtE5vyOZWtelJI0XGui9bAFMO9GIT
 vUpvxsEAfLgbdyx7h8sJJGc+APFfttkvrzQMIRN/CM41Bs9IbvSSc+FF5V2s+LvP42EI539Na2S
 PmKoItEeyIcoQa+YHgA==
X-Received: from edbbc7.prod.google.com ([2002:a05:6402:2047:b0:654:503e:5179])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4017:b0:65c:2120:4055 with SMTP id
 4fb4d7f45d1cf-65ea4ef5fc1mr4684466a12.17.1771841313635; 
 Mon, 23 Feb 2026 02:08:33 -0800 (PST)
Date: Mon, 23 Feb 2026 10:08:24 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABgnnGkC/3XMQWrDMBCF4asErTNlZjSu5a56j9CFLI8dkcQqV
 jEJwXevEmhLHbJ8D77/arJOUbN521zNpHPMMY1lVNuNCXs/DgqxK9swcoUNCoTjAbKOHeTLGMC
 G3te9KAVlU8znpH0833u7j7L3MX+l6XLPz3R7n5VmAgJxHbK1jNq69yGl4agvIZ3MLTXzLydkX
 HMGBBHfVtZ6RScP3P5xJrfmtnAV17JyT+rDA5cf/opEds2l8Jq4DXXXiK+bf3xZlm9QTlKAaAE
 AAA==
X-Change-Id: 20250904-clk-send-sync-3cfa7f4e1ce2
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1405; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=fgB/iwLbohKh980nUt8XO9waGZx3cLIN28KQTHavg30=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpnCcbiIu+R+hONicI/5HczHhqmbqxSjeE33oZ0
 C7LVlUNYxWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaZwnGwAKCRAEWL7uWMY5
 RjabEACzuGAOA16XYr7603EjsixgD4+MZeZHTazYT1169bUuHnSo3QoKPuZkN1kdkRtOy6YgOnk
 PpsY6nAPlmM0rSpPPTgq9GIYMuxGj8Ncp+2R84WBToDSn61axTSzHSJsE9iF2fGPtV+yQiQ5vo2
 Wr1RWr1ZfNnK0cHGL8ImbArrHUMZH3C/JAQKwPMFCTVUFH3i0LQlMGy44A8oo0yqQpCgqVJKUuj
 G5GT6RLyPmcLcd+7jsV/qaDOGyc+/gkF/yfTDsk0DV5IhgVqsHG7iO5F3Jl6tbX3JRe0q1UtEVe
 7ApNIttnFsBpF5n49tj+RfyrshVI9EjWZE7f4E0eCo8+MBnNgqRyeJfb7UFPh4W0B/G16NfLu38
 SkMbrLJnalt7IfA2B3/Oi8W1jg5K7Rw0NPuRc0X4ws04qON7jEq3TtAjwuj9vbGWzPOAdDCeP9A
 MpQOXyzsTfF9E4Z3QTFYYYEUiVVzK9takPy8oiYp+1AZEH3zMoRp360GegLQK4X1SHi3MhGUzI6
 wgKiWEBU4vSCqHTmcnMwNtuY7551LnVrn5oHjRH27Fe4muJgovNbenKsfGRx2Ud45xKMiKAUCxR
 AM6DCKpA9r8XIfinK5fFvyADHVdFilFkYAf0KOjo+zqa/h8g6WY6BgUNBLHTi13GZumE7phzwrl
 HXc+BH6rkn6/Ssg==
X-Mailer: b4 0.14.2
Message-ID: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com>
Subject: [PATCH v5 0/3] Implement Send and Sync for clk
From: Alice Ryhl <aliceryhl@google.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, 
 "=?utf-8?q?Uwe_Kleine-K=C3=B6nig?=" <ukleinek@kernel.org>,
 Michal Wilczynski <m.wilczynski@samsung.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>,
 Gary Guo <gary@garyguo.net>, 
 "=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-pwm@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
 Boqun Feng <boqun@kernel.org>
Content-Type: text/plain; charset="utf-8"
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sboyd@kernel.org,m:mturquette@baylibre.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:ukleinek@kernel.org,m:m.wilczynski@samsung.com,m:viresh.kumar@linaro.org,m:ojeda@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:linux-clk@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pwm@vger.kernel.org,m:aliceryhl@google.com,m:boqun@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[baylibre.com,linux.intel.com,kernel.org,redhat.com,samsung.com,linaro.org,garyguo.net,protonmail.com,umich.edu,collabora.com,vger.kernel.org,lists.freedesktop.org,google.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9828F174921
X-Rspamd-Action: no action

The Clk type is thread-safe, so let's mark it as thread-safe in the type
system. This lets us get rid of hacks in drivers.

For Stephen's clk tree.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v5:
- Rebase on v7.0-rc1.
- Pick up Reviewed-by tags.
- Link to v4: https://lore.kernel.org/r/20260113-clk-send-sync-v4-0-712bc7d94a79@google.com

Changes in v4:
- Pick up Reviewed-by tags.
- Link to v3: https://lore.kernel.org/r/20251218-clk-send-sync-v3-0-e48b2e2f1eac@google.com

Changes in v3:
- Rebase on v6.19-rc1.
- Pick up tags.
- Add fix for pwm driver as well.
- Link to v2: https://lore.kernel.org/r/20251020-clk-send-sync-v2-0-44ab533ae084@google.com

Changes in v2:
- Rebase on v6.18-rc1.
- Add patch to tyr driver.
- Link to v1: https://lore.kernel.org/r/20250904-clk-send-sync-v1-1-48d023320eb8@google.com

---
Alice Ryhl (3):
      rust: clk: implement Send and Sync
      tyr: remove impl Send/Sync for TyrData
      pwm: th1520: remove impl Send/Sync for Th1520PwmDriverData

 drivers/gpu/drm/tyr/driver.rs | 12 ------------
 drivers/pwm/pwm_th1520.rs     | 15 ---------------
 rust/kernel/clk.rs            |  7 +++++++
 3 files changed, 7 insertions(+), 27 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20250904-clk-send-sync-3cfa7f4e1ce2

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

