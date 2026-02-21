Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AEqAGaUmWnRVAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 12:17:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F0B16CBF7
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 12:17:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95CEC10E029;
	Sat, 21 Feb 2026 11:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="MbVDhQD9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D07AF10E029
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 11:17:54 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-4806b12ad3fso19894255e9.0
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Feb 2026 03:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1771672673; x=1772277473;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=nLgfgkjh77J46ZUln9D17ln2Gi3ljJZ5rCGVfoowYl0=;
 b=MbVDhQD9k/wHAp0quXeGgBdojN1Gd9FTcKJKa9VLdOr24UV81WZTob+agkUVofVdJn
 DU8JnGUlfBxhTEHRUetIwPbBSHfsS/LU/UDF3+uYoIgorxnEuqeRIS4xFRw5OV0P0RLf
 +4uidJYGAfQ0Gd7TggQEnl+IeEcmdKrK58kpciAlvLMi8jsapHzqruGFFuWU+gJze5V/
 Aa+vOvfP3pFwCsRr651/p4qNrsxwaldstYgpYT0v71ujUXKa0OjGnyjRKLvDxLPaJr4w
 0V47CF5bKIVWArBiv1IAoWsLEQDTe7MwVz0/vxg88AGWMC5PlBPsF9c+p3w0lQr9MzhI
 oeqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771672673; x=1772277473;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nLgfgkjh77J46ZUln9D17ln2Gi3ljJZ5rCGVfoowYl0=;
 b=gVOa9gG16Ae3/lLAeJxxuZNIa/j0l/SpYwkrKkGpu6OQexwqcV5IzjDfHIQvmYHDRu
 VWhyz5O5MpQIjKxJfaHNtoCushoREGUH6wHku+I5/J7W2l3sjtE5HZs/RO+c4bxutet2
 7JMRjKtBpD/GWAoz8/7B0wxwg6IsiAJmMqGzNnaP1q48tkUqHCycpz9aGFs97RjNL64m
 eiGMTl1WMPUGfU7A1Y44xiR+gKxn3bpzu91mrsHbEGNkqZ2/iymgRVDgxgNp9L1dRIU1
 nJkDbP6D/eW2Q3a4iSoVRsB7SZOHZNp7ol5MZDVkX5pz8FEEDZZMQG4gik5gmS7nYwnt
 TzVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWR8FwuGtCpne8SwYsRNqmnHMhO52d3d4Y0rHk/kRPY2cc8EDVKgvlpOv80roxVMFWNos4G8Wd8xWQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDpvSMN4ABVKfAveokoKTVEOqL8rTeVuxhkNntnPK5IsTo5rDc
 aXVc9giv94vskxdx+f/aCiostdlxF+naRfaWK/u3xQw3gG5aEhHmDSZZEPy5zvyARBGGdx8iVcM
 G9KvZw9oNksjGy2gIoQ==
X-Received: from wmqt10.prod.google.com ([2002:a05:600c:198a:b0:47e:e27f:e298])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5020:b0:483:a2db:6743 with SMTP id
 5b1f17b1804b1-483a95eb82amr44441335e9.4.1771672673212; 
 Sat, 21 Feb 2026 03:17:53 -0800 (PST)
Date: Sat, 21 Feb 2026 11:17:52 +0000
In-Reply-To: <20260212120538.13f81d8a@fedora>
Mime-Version: 1.0
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-9-deborah.brouwer@collabora.com>
 <20260212120538.13f81d8a@fedora>
Message-ID: <aZmUYJeV1F24m3kN@google.com>
Subject: Re: [PATCH 08/12] drm/tyr: add MMU module
From: Alice Ryhl <aliceryhl@google.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, daniel.almeida@collabora.com, 
 beata.michalska@arm.com, lyude@redhat.com
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
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:beata.michalska@arm.com,m:lyude@redhat.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[google.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 84F0B16CBF7
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 12:05:38PM +0100, Boris Brezillon wrote:
> On Wed, 11 Feb 2026 17:37:09 -0800
> Deborah Brouwer <deborah.brouwer@collabora.com> wrote:
> 
> > +
> > +impl Mmu {
> > +    pub(crate) fn new(
> > +        pdev: &platform::Device,
> > +        iomem: ArcBorrow<'_, Devres<IoMem>>,
> > +        gpu_info: &GpuInfo,
> > +    ) -> Result<Arc<Mmu>> {
> 
> Maybe the Mmu should be wrapped in a Devres, like we do with other HW
> components that require the underlying device to be bound to access
> registers. I mean, we do have iomem wrapper into a Devres, so maybe
> that's not needed, dunno.

I wouldn't add Devres just for fun. If none of the fields require it,
then I wouldn't bother.

Alice
