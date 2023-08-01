Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5934076C150
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 02:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE5BC10E00C;
	Wed,  2 Aug 2023 00:03:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 500 seconds by postgrey-1.36 at gabe;
 Wed, 02 Aug 2023 00:03:37 UTC
Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com
 [216.40.44.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AAB010E00C
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 00:03:37 +0000 (UTC)
Received: from omf10.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay06.hostedemail.com (Postfix) with ESMTP id F2717B2539;
 Tue,  1 Aug 2023 23:55:15 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf10.hostedemail.com (Postfix) with ESMTPA id E337B2F; 
 Tue,  1 Aug 2023 23:55:13 +0000 (UTC)
Message-ID: <b8f781d95ecdb78b70407727001639f9f3ba0833.camel@perches.com>
Subject: Re: [PATCH v5 22/22] checkpatch: reword long-line warn about
 commit-msg
From: Joe Perches <joe@perches.com>
To: Jim Cromie <jim.cromie@gmail.com>, jbaron@akamai.com, 
 daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Date: Tue, 01 Aug 2023 16:55:12 -0700
In-Reply-To: <20230801233515.166971-28-jim.cromie@gmail.com>
References: <20230801233515.166971-1-jim.cromie@gmail.com>
 <20230801233515.166971-28-jim.cromie@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Rspamd-Queue-Id: E337B2F
X-Spam-Status: No, score=1.07
X-Rspamd-Server: rspamout06
X-Stat-Signature: nufxsppdyxgk8eoaxxi3ysizgfwzpstj
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/6WcQFjmsdLNG2lQCATvg+ZVOz31Si7uQ=
X-HE-Tag: 1690934113-678004
X-HE-Meta: U2FsdGVkX19xkloRoj//YznJ3GV6zVkt9bHv4fIOqYVdjgiMXjSj364IkTw1byvW6DJHLxPOsixdnfvsukWkwVKkCKD1bfoN4mvQ8gbigwS2yT0MHCQvUpfPi9qnNrsLYxaxwJhIt3gqC/vGHH4jpYsrX6f0QE7CjeyUHbq2MyUZx+5b4t7nHmETaEYyKbWqiG4/AsgAnLVjQn5bPDv7CGYA1RFkAcTuNjlnfvjlj6WvOjgoKDes14ntpv4fYxMuttaTVfEpljUtT6dtDX5XXJH7DFZLmOIPg5SBd/i/sFI99MJLMkvaj1E0W5uhznXf
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
Cc: apw@canonical.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2023-08-01 at 17:35 -0600, Jim Cromie wrote:
> Reword the warning to complain about line length 1st, since thats
> whats actually tested.
[]
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -3272,7 +3272,7 @@ sub process {
>  					# A Fixes:, link or signature tag line
>  		      $commit_log_possible_stack_dump)) {
>  			WARN("COMMIT_LOG_LONG_LINE",
> -			     "Possible unwrapped commit description (prefer a maximum 75 char=
s per line)\n" . $herecurr);
> +			     "Prefer a maximum 75 chars per line (possible unwrapped commit d=
escription?)\n" . $herecurr);
>  			$commit_log_long_line =3D 1;
>  		}

I don't think this adds any clarity.  Anyone else?=20

