Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B07ABB594
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 09:08:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C54710E113;
	Mon, 19 May 2025 07:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OeNgAneb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F00B710E1FE
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:52:11 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-601aa44af77so1361548a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 02:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747561930; x=1748166730; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding:in-reply-to:date
 :cc:to:from:subject:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=xNezKkV3ebczK8qcbRyMSzCKTpQqOqkTvCZZ/qTf9JQ=;
 b=OeNgAnebasWqqDbiRqCAIx7pQ1/UTTmuBwpEuauqF/FPgzPwx+S1Gtf5DzzPK9BU1p
 v68BdRaXvy6mpKBHt8H94TWYJLWiRw8F52gEV25ijAh5YJYad7LnkJZ7z6NDfqOi+v91
 oAsJMvNS9wy7Q5vmjNXtD8MT6H/L4bBk93cq6eohLcJT6yk4a9/x79RR9s0ELXZ6MJtn
 DTP2/Gjnsu48QJYOulkRJviHFivm2Z313ihIl0DWxjyP39W5wMUWfXVZu6X6am33wH0J
 gZh+56AZtZWZz7KLnUvXiR/nM5h00EPf6V61lD7SZ0OaLS+meKYaU+YB9bFx/opwKHu5
 t6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747561930; x=1748166730;
 h=mime-version:user-agent:content-transfer-encoding:in-reply-to:date
 :cc:to:from:subject:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=xNezKkV3ebczK8qcbRyMSzCKTpQqOqkTvCZZ/qTf9JQ=;
 b=CPNfhuarAUfnUNW6najvT3QGi2UgTChMnHVEMh3p1VteFW81pYvP2XJ90H95OH2BLp
 pWDDt2DCSKm5A7DPJtmZebioDhSmIXv2uuRbz+cZlQwKIfrCk5dUI26Hh4h+5mBjCMxN
 Ur0DQTMaovqrNrsGsPldecaR/8r67F7pThDT002F5alHA07x+NmL+mu8Fxdd/ysQEi/N
 fcA46mS1ayOG1u7kK8oJh4K60w+xujaEy8LhRtu0EkLKPOE000lIiO2H6xjk0bIuZZJB
 AybJzKJXyXQ1R7AuJ8Poo/3QAu9TfidZSktl6xFOcfGPf0xc/r8c/GsVWYYRqb1VngBS
 fbYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXm+81EOOYtCtjzSUAFJgaq9hK+ij/uH3RxA7ZQNDlE/y30+nXBPHnCCHCmUKvOQyb8tIm/e3AGNLU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPGEtONsMmWa3MqHBNg8kYtu8bDoJs12dmc696HLup34GCOWvi
 MWSrIBb3TZ4T3zcrPNV0mmQGx48W6AnAzgr7ktHL3TtDa4BCQbc6gBDo
X-Gm-Gg: ASbGnct8PyV+fK8PSyAVnV4s9NXG/i4jKICf68ggv9k6/Y5x7beJEIWxCFW6djJjDr+
 LJGiKY0y/LqZkEpC3dXh8SS8kiJMX0adIwjwNDpcioCkCENNIaeCgAjYGhmAtfo3rOKmLvvxsOK
 boGUP4zEKNKxrw2fB4NNeHCt3lEptscYb3HY6JGqf/F5/ycsZg1ifiAlJl53+DkSQG5um5kQ2K7
 0cBlkRME+EKieKTKbcvjDZemSg6Y+0ib0qNY2Ut3RlG8q6/QsmDbKfnfRZTiew5p2/y9pmRKz+w
 iHDzabs9CYsWhT/QLbV+yB0UUeGc4/x9QW/wtHJakPzT7IIHJK33Uf4N50Rcxuk2rhGLOg1p3Zi
 +HGnNci1gYGigj3SYH0pqY13vIrhwvcxgCLTl0OLr
X-Google-Smtp-Source: AGHT+IHP1DmeZ8foZI3IYMKP3rpqfL/YaSVCgJnkLE879K6isE5Bxfz4HkwU1M93ur6uQywgpsPD9Q==
X-Received: by 2002:a17:907:7b9e:b0:ad5:c06:8d6e with SMTP id
 a640c23a62f3a-ad52d609a9dmr838369566b.56.1747561929754; 
 Sun, 18 May 2025 02:52:09 -0700 (PDT)
Received: from ?IPv6:2001:b07:5d29:f42d:3e7a:15ee:51c1:139?
 ([2001:b07:5d29:f42d:3e7a:15ee:51c1:139])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6004d50364dsm4040958a12.32.2025.05.18.02.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 02:52:09 -0700 (PDT)
Message-ID: <4fde4c953a4204e70d89f2c3dfd24eccdac0540f.camel@gmail.com>
Subject: Re: [PATCH v2 5/8] KVM: SEV: Prefer WBNOINVD over WBINVD for cache
 maintenance efficiency
From: Francesco Lavra <francescolavra.fl@gmail.com>
To: seanjc@google.com
Cc: airlied@gmail.com, bp@alien8.de, dave.hansen@linux.intel.com, 
 dri-devel@lists.freedesktop.org, kai.huang@intel.com,
 kevinloughlin@google.com,  kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org,  maarten.lankhorst@linux.intel.com,
 mingo@redhat.com, mizhang@google.com,  mripard@kernel.org,
 pbonzini@redhat.com, simona@ffwll.ch, szy0127@sjtu.edu.cn, 
 tglx@linutronix.de, thomas.lendacky@amd.com, tzimmermann@suse.de,
 x86@kernel.org
Date: Sun, 18 May 2025 11:52:07 +0200
In-Reply-To: <20250516212833.2544737-6-seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 19 May 2025 07:08:02 +0000
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

On 2025-05-16 at 21:28, Sean Christopherson wrote:
> @@ -3901,7 +3908,7 @@ void sev_snp_init_protected_guest_state(struct
> kvm_vcpu *vcpu)
> =C2=A0	 * From this point forward, the VMSA will always be a guest-
> mapped page
> =C2=A0	 * rather than the initial one allocated by KVM in svm-
> >sev_es.vmsa. In
> =C2=A0	 * theory, svm->sev_es.vmsa could be free'd and cleaned up here,
> but
> -	 * that involves cleanups like wbinvd_on_all_cpus() which would
> ideally
> +	 * that involves cleanups like flushing caches, which would
> ideally be
> =C2=A0	 * be handled during teardown rather than guest boot.  Deferring
> that

Duplicate "be"
