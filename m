Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6FB6319B7
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 07:26:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0D410E02A;
	Mon, 21 Nov 2022 06:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B29F810E02A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 06:26:02 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id h21so6743802qtu.2
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Nov 2022 22:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EOs0qwxAH2/pioGUQjAqQZCo5hozuq4moR5tVBbEUtg=;
 b=KfOTHl7grc1+6ZofGZsTdaxAlmOrRNoG6BfBMqSr8xX4NIhIqXAva2jAsFnxYEkdkS
 Ee1Zgia2BPvpj4cOA6FtPSgT7119UG5yKsQdECWZj+M32SeyC9RtXIhWjM4Y6c+rogP+
 IupooRNF5leuyXXUTOqGEBswe0AdgqCvZHERasju3qalsZmMIIMJxFdXiYGCzMeexGSI
 YL49rQ0fwc42sA0G9WcDi2jlbQyUwB7ZYuR5uNrllf2n9LwJe5HE/2EJ6Ow25nR9ZMOa
 Lv4Ux0oYjcysVysviLeqSLSw8pHzabg4Dmc3qwxyOG1Kzavve2uh6WZFC9U5n7QFZ4/l
 tKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EOs0qwxAH2/pioGUQjAqQZCo5hozuq4moR5tVBbEUtg=;
 b=asep3+7YZCvAQalPtNxvJU7ng8X6PjtGJZVygrO18RdMIJrvZ0GCrOT8b9SRiCAUrY
 /emDCMVrffoVpVDhQTrZQUE3ZwBTgCPnnzhhciL9sbX5DsopV/SN+lf1/HT5aKoqVihf
 kVUyuHCtJwy6fl+5dZEfMHTNG67TDLF0an/ZM0fi9ZSWS3h1EOHY2vqYLwfC+QpZKrlY
 MMXeQ91KCKEzlVOgBhgz2GN0Sq7f/OTUMRYrthiifgKPHxmPDdc5PEBfGOuHMZTo8/7Q
 0Or5yWHJMPP444HSEjMEYGAs2MH24zFmsMKi3K5J7a5DHaXV74Z8C+3yyZJh24nLwidY
 FUfQ==
X-Gm-Message-State: ANoB5pmPBIi4WFKpXddtEBmRW3tTXX+7P1ffbFlItknqqyghXviazRfy
 WES4G35/iO4KZSjW6sYwcbQS98UzhS5viKmkGSA=
X-Google-Smtp-Source: AA0mqf7sF2jElD5/SyliGDaozdhgYHqQGtqU+cPqD/Zifqs5evBzkXqDWE3qE0hFQZ7/1dUasxI0NMx8R3/eYeqbVUw=
X-Received: by 2002:ac8:7cbb:0:b0:399:83a8:c28b with SMTP id
 z27-20020ac87cbb000000b0039983a8c28bmr4786015qtv.447.1669011961658; Sun, 20
 Nov 2022 22:26:01 -0800 (PST)
MIME-Version: 1.0
References: <20221119204435.97113-1-ogabbay@kernel.org>
In-Reply-To: <20221119204435.97113-1-ogabbay@kernel.org>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 21 Nov 2022 16:25:50 +1000
Message-ID: <CAPM=9twtQry6S=+Gy2NiUDzX8vrkqHgxCNm8o9UDK8oHtNUZSw@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] new subsystem for compute accelerator devices
To: Oded Gabbay <ogabbay@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: dri-devel@lists.freedesktop.org,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Christopher Friedt <chrisfriedt@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Christoph Hellwig <hch@infradead.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Jiho Chu <jiho.chu@samsung.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 20 Nov 2022 at 06:44, Oded Gabbay <ogabbay@kernel.org> wrote:
>
> This is the fourth (and hopefully last) version of the patch-set to add the
> new subsystem for compute accelerators. I removed the RFC headline as
> I believe it is now ready for merging.
>
> Compare to v3, this patch-set contains one additional patch that adds
> documentation regarding the accel subsystem. I hope it's good enough for
> this stage. In addition, there were few very minor fixes according to
> comments received on v3.
>
> The patches are in the following repo:
> https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/accel.git/log/?h=accel_v4
>
> As in v3, The HEAD of that branch is a commit adding a dummy driver that
> registers an accel device using the new framework. This can be served
> as a simple reference.
>

FIx the nits Jeffery raised and the one I brought up and I think we
should be good for this to be in a PR.

Reviewed-by: Dave Airlie <airlied@redhat.com>
