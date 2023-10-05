Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC33F7B9BD3
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 10:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2590B10E1BD;
	Thu,  5 Oct 2023 08:36:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3C0310E03F;
 Thu,  5 Oct 2023 08:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696495008; x=1728031008;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=o+aBqlo15Ep0GJNh6RrCe4Nj0ASretVZm8+G/ZfLFYQ=;
 b=N8ZGGibtFX1VixyhZDoYtql4OVYJmhNVtbzng9C0Y1A8oAt1nr+1GlMG
 ONg1jAIpedyHcTqvWQE8EnTs2AIRnvnDVNcSeXyUWxdECwdNLfOG5BR5w
 CH2xCIwsAhU6zUL5P7UkvIst6KzWJUj0kVlZ1ouedjfDlnR1iRCwgGx20
 EgnLxEMBQGRwTsJw551+Rd5pid28omgeT45Ijb8Z+E6NaBfGtNlKW2ipL
 92Eb/ec4CRitq3UvG+khxoQ18AJ6jdanOcNPidOlr4thWMe9LEvBwACaO
 id97hQyx77XzLjFmmniLv01oy8isMBJZGvjT9lgFepdsmvrY4UpMpsYvF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="363725129"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; d="scan'208";a="363725129"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 01:36:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="925506120"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; d="scan'208";a="925506120"
Received: from lapeders-mobl1.ger.corp.intel.com (HELO [10.249.254.139])
 ([10.249.254.139])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 01:36:45 -0700
Message-ID: <fbc3e29ed30e327f6702750a1e4c6a2529fa2f33.camel@linux.intel.com>
Subject: Re: bulk_move in ttm_resource manager
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, "Zeng,
 Oak" <oak.zeng@intel.com>
Date: Thu, 05 Oct 2023 10:36:39 +0200
In-Reply-To: <a657c5d1-e5ef-446b-9481-c55f2c59c20b@amd.com>
References: <SA1PR11MB69918FBD6B32447AEB6E0F6A92CBA@SA1PR11MB6991.namprd11.prod.outlook.com>
 <d29ad7b31b39e95280cc96ad93613967467721bb.camel@linux.intel.com>
 <a657c5d1-e5ef-446b-9481-c55f2c59c20b@amd.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2023-10-04 at 14:44 +0200, Christian K=C3=B6nig wrote:
> Am 04.10.23 um 09:17 schrieb Thomas Hellstr=C3=B6m:
> > On Wed, 2023-10-04 at 03:52 +0000, Zeng, Oak wrote:
> > > Hi Christian,
> > > =C2=A0=20
> > > As a follow up to this thread:
> > > https://www.spinics.net/lists/dri-devel/msg410740.html, I started
> > > the
> > > work of moving the lru out of ttm_resource_manager and make it a
> > > common library for both ttm and svm. While look into the details
> > > of
> > > the bulk_move in ttm resource manager, I found a potential
> > > problem:
> > > =C2=A0=20
> > > For simplicity, let=E2=80=99s say we only have one memory type and on=
e
> > > priority, so ttm resource manager only maintains one global lru
> > > list.
> > > Let=E2=80=99s say this list has 10 nodes, node1 to node10.
> > > =C2=A0=20
> > > But the lru_bulk_move is per vm. Let=E2=80=99s say vm1 has a bulk_mov=
e
> > > covering node range [node4, node7] and vm2 has a bulk_move
> > > covering
> > > node range [node6, node9]. Notice those two range has an overlap.
> > > Since two vm can simultaneously add nodes to lru, I think this
> > > scenario can happen.
>=20
> That can't happen. See what ttm_resource_move_to_lru_tail() does when
> the BO has a bulk move associated with it.
>=20
> > > =C2=A0=20
> > > Now if we perform a bulk move for vm1, moving [node4, node7] to
> > > the
> > > tail of the lru list. The lru after this bulk move will be:
> > > node1,
> > > node2, node3,node8,node9, node10, node4, node5, node6, node7. Now
> > > notice that for vm2=E2=80=99s bulk_move, the first pointer =C2=A0(poi=
nting to
> > > node6) is actually after the last pointer (pointing to node9),
> > > which
> > > doesn=E2=80=99t make sense.
> > > =C2=A0=20
> > > Is this a real problem? As I understand it, with this issue, we
> > > only
> > > mess up the lru list order, but there won=E2=80=99t be any functional
> > > problem. If it is a real problem, should we make the bulk_move
> > > global
> > > instead of per vm based?
> > > =C2=A0=20
> > > Thanks,
> > > Oak
> > > =C2=A0=20
> > FWIW I have a patch set that converts the TTM bulk move code to
> > using
> > sublists; a list item is either a resource or a sublist, and when
> > performing a bulk move essentially the sublist is moved. Bumping
> > resource LRU within a VM would touch only the sublist.
>=20
> That sounds like my very first attempt at bulk moves which we
> abandoned=20
> for various reasons.
>=20
> That's easily >5years ago, but the history of that should still be on
> the mailing list if I'm not completely mistaken.

This here?

https://lists.freedesktop.org/archives/amd-gfx/2018-August/025016.html

No, in that case it's very different. Or is it an even earlier version?

/Thomas


>=20
> Regards,
> Christian.
>=20
> >=20
> > Currently functionality and TTM API is essentially the same but
> > when
> > experimenting with LRU traversal for exhaustive WW-locking eviction
> > this concept was easier to use. Also hopefully this would reduce
> > fragility and improve understanding since a scenario like the above
> > could really never happen...
> >=20
> > Let me know if I should send it out as an RFC.
> >=20
> > Code is here:
> > https://gitlab.freedesktop.org/drm/xe/kernel/-/merge_requests/351/commi=
ts
> >=20
> > /Thomas
> >=20
> >=20
> >=20
> >=20
> >=20
>=20

