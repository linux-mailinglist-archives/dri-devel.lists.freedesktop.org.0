Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D86A46D1E15
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 12:34:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4125F10F1C9;
	Fri, 31 Mar 2023 10:34:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 679A510F1C9
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 10:34:20 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1piC5D-0002Be-5M; Fri, 31 Mar 2023 12:34:11 +0200
Message-ID: <7d8cae85-5d0a-599e-cc48-0d06db27d9fe@leemhuis.info>
Date: Fri, 31 Mar 2023 12:34:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US, de-DE
To: Conor Dooley <conor.dooley@microchip.com>
References: <20230314-doc-checkpatch-closes-tag-v3-0-d1bdcf31c71c@tessares.net>
 <2194d19d-f195-1a1e-41fc-7827ae569351@leemhuis.info>
 <cf5a3e73-c97d-4f98-80d7-4bcc68eb557a@spud>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [PATCH v3 0/4] docs & checkpatch: allow Closes tags with links
In-Reply-To: <cf5a3e73-c97d-4f98-80d7-4bcc68eb557a@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1680258860;efe5fe62;
X-HE-SMSGID: 1piC5D-0002Be-5M
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
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Andy Whitcroft <apw@canonical.com>,
 Matthieu Baerts <matthieu.baerts@tessares.net>,
 Andrew Morton <akpm@linux-foundation.org>, mptcp@lists.linux.dev,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31.03.23 12:08, Conor Dooley wrote:
> On Fri, Mar 31, 2023 at 11:39:22AM +0200, Thorsten Leemhuis wrote:
> 
>> -Please check the link to make sure that it is actually working and points
>> -to the relevant message.
>> +If the URL points to a bug report that is fixed by the patch, use 'Closes:'
>> +instead.
> 
> This is not specifically a comment about your additional diff, but this
> sprang to mind (again) while reading it.
> I have been wondering if this sort of thing will lead to inconsistency. 
> Reports sometimes report more than one issue at once. Other times a
> patch that is (intentionally) not a complete fix for the problem.
> Using Closes: in those cases is not really true, as it does not close
> the report.
>
> Having a series of N patches, each of which purport to close an issue,
> also doesn't seem quite right.
> The word Closes has a meaning and "forcing" the use of Closes: for
> reports implies meaning that may not be present.
> 
> I suppose it is true that just because documentation or checkpatch says
> to do something, doesn't mean that you **have** to do it but I don't
> want to be the one on the Rx side of a rant...

Yeah, maybe checkpath.pl should allow a "Link" after a "Reported-by" for
cases like this, then developers could save "Closes" for the patch that
addresses the last of the issues the report is about.

OTOH checkpatch.pl currently just prints a warning, so developers could
ignore this and do the above already now, as you say. Guess it depends
on how often we expect "one report with multiple issue" to happen.

Maybe this is an indicator that we are on the wrong track in general and
should not do any of this and just stick to "Link:".

Ciao, Thorsten
